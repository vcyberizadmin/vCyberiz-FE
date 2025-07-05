import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/bloc/privacy_bloc/privacy_bloc.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/data/model/privacy_model/privacy_model.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';
import 'package:vcyberiz/screens/privacy_policy/widgets/header_widget.dart';
import 'package:vcyberiz/screens/privacy_policy/widgets/policy_desktop_body.dart';
import 'package:vcyberiz/screens/privacy_policy/widgets/policy_page.dart';
import 'package:vcyberiz/screens/privacy_policy/widgets/table_of_content.dart';

import '../base_view/widget/footer/footer_screen.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _tocScrollController = ScrollController();

  final Map<String, GlobalKey> sectionKeys = {};
  final GlobalKey _policyBodyKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();

  final ValueNotifier<double> stickyPosition = ValueNotifier(0.0);

  double? _contentHeight;
  double? _footerHeight;
  bool _lastIsTopVisible = true;

  final Map<String, String> idToTitle = {}; // map id → title

  bool _isManualSelection = false; // prevent conflict between click & scroll

  @override
  void initState() {
    super.initState();
    context.read<PrivacyBloc>().add(const GetPrivacyDataEvent());
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureHeights());
    _scrollController.addListener(_onScroll);
  }

  void _measureHeights() {
    _measureHeight(_policyBodyKey, (h) => _contentHeight = h);
    _measureHeight(_footerKey, (h) => _footerHeight = h);
  }

  void _measureHeight(GlobalKey key, void Function(double) setHeight) {
    final ctx = key.currentContext;
    if (ctx != null) {
      final box = ctx.findRenderObject() as RenderBox;
      setState(() => setHeight(box.size.height));
    }
  }

  void _onScroll() {
    final isTopVisible = _scrollController.offset <= 70;
    if (_lastIsTopVisible != isTopVisible) {
      _lastIsTopVisible = isTopVisible;
      context.read<HomeBloc>().add(ToggleIsTopContainerVisible(isTopVisible));
    }
    _updateStickyPosition();
    _updateActiveSection();
  }

  void _updateStickyPosition() {
    const stickyThreshold = 160;
    final offset = _scrollController.offset;
    double newSticky =
        offset >= stickyThreshold ? offset - stickyThreshold : 0.0;

    final maxSticky = ((_contentHeight ?? 0) + (_footerHeight ?? 0)) -
        MediaQuery.of(context).size.height;
    if (maxSticky > 0 && newSticky > maxSticky) newSticky = maxSticky;

    if (newSticky != stickyPosition.value) stickyPosition.value = newSticky;
  }

  void _updateActiveSection() {
    if (_isManualSelection) return; // skip if manual scroll from click

    String? currentSectionId;
    sectionKeys.forEach((id, key) {
      final ctx = key.currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox;
        final pos = box.localToGlobal(Offset.zero).dy;
        if (pos - 120 <= 0) {
          currentSectionId = id;
        }
      }
    });

    if (currentSectionId != null) {
      final title = idToTitle[currentSectionId!];
      final state = context.read<PrivacyBloc>().state;
      if (title != null && state.selectedItem != title) {
        context.read<PrivacyBloc>().add(UpdateSelectedItemEvent(title));
      }
    }
  }

  void scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      final box = ctx.findRenderObject() as RenderBox;
      final offset =
          box.localToGlobal(Offset.zero).dy + _scrollController.offset;

      _isManualSelection = true; // disable scroll detection temporarily
      _scrollController
          .animateTo(
        offset - 100,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      )
          .whenComplete(() {
        _isManualSelection = false; // re-enable after scroll finishes
      });
    }
  }

  void _buildSectionKeys(List<PrivacyPolicyList> list) {
    sectionKeys.clear();
    idToTitle.clear();
    for (final item in list) {
      final parentId =
          (item.privPolicyPointsHd ?? '').toLowerCase().replaceAll(' ', '_');
      sectionKeys[parentId] = GlobalKey();
      idToTitle[parentId] = item.privPolicyPointsHd ?? '';
      for (final sub in item.privPolicySubPoints ?? []) {
        final subId =
            (sub.privPolicySubHd ?? '').toLowerCase().replaceAll(' ', '_');
        sectionKeys[subId] = GlobalKey();
        idToTitle[subId] = sub.privPolicySubHd ?? '';
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tocScrollController.dispose();
    stickyPosition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: BlocBuilder<PrivacyBloc, PrivacyState>(
        builder: (context, state) {
          final list = state.data?.privacyPolicy ?? [];
          if (sectionKeys.isEmpty && list.isNotEmpty) _buildSectionKeys(list);
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                ResponsiveBuilder(
                  builder: (_, sizing) => sizing.isDesktop
                      ? _desktopLayout(state, list)
                      : _mobileTabletLayout(state, list),
                ),
                FooterScreen(key: _footerKey),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _desktopLayout(PrivacyState state, List<PrivacyPolicyList> list) {
    return SizedBox(
      width: Constants.width,
      child: Center(
        child: SizedBox(
          width: getValueForScreenType<double>(
            context: context,
            mobile: Constants.width * 0.96,
            tablet: Constants.width * 0.92,
            desktop: Constants.desktopBreakPoint,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(60),
              HeaderWidget(text: state.data?.secHeader ?? ''),
              const Gap(40),
              PolicyDesktopBody(
                key: _policyBodyKey,
                stickyPosition: stickyPosition,
                sectionKeys: sectionKeys,
                policiesList: list,
                scrollToSection: scrollToSection,
                tocScrollController: _tocScrollController,
                footerHeight: _footerHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mobileTabletLayout(PrivacyState state, List<PrivacyPolicyList> list) {
    final padding = getValueForScreenType<double>(
      context: context,
      mobile: 16,
      tablet: 32,
      desktop: MediaQuery.of(context).size.width > 1126 ? 120 : 60,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(text: state.data?.secHeader ?? ''),
          TableOfContentsWidget(
            policiesList: list,
            sectionKeys: sectionKeys,
            onTapSection: scrollToSection,
            tocScrollController: _tocScrollController,
            footerHeight: _footerHeight,
          ),
          PolicyPoints(sectionKeys: sectionKeys),
        ],
      ),
    );
  }
}
