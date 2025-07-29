// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/bloc/home-bloc/home_state.dart';
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
  final Map<String, String> idToTitle = {};
  bool _isManualSelection = false;

  @override
  void initState() {
    super.initState();
    context.read<PrivacyBloc>().add(const GetPrivacyDataEvent());
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureHeights());
    _scrollController.addListener(_onScroll);
  }

  void _measureHeights() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final policyContext = _policyBodyKey.currentContext;
      final footerContext = _footerKey.currentContext;

      final canMeasurePolicy = policyContext?.findRenderObject() is RenderBox &&
          (policyContext!.findRenderObject() as RenderBox).hasSize;

      final canMeasureFooter = footerContext?.findRenderObject() is RenderBox &&
          (footerContext!.findRenderObject() as RenderBox).hasSize;

      if (canMeasurePolicy && canMeasureFooter) {
        _measureHeight(_policyBodyKey, (h) => _contentHeight = h);
        _measureHeight(_footerKey, (h) => _footerHeight = h);
      } else {
        _measureHeights();
      }
    });
  }

  void _measureHeight(GlobalKey key, void Function(double) setHeight) {
    final ctx = key.currentContext;
    if (ctx != null) {
      final renderObject = ctx.findRenderObject();
      if (renderObject != null &&
          renderObject is RenderBox &&
          renderObject.hasSize) {
        final height = renderObject.size.height;
        setState(() => setHeight(height));
      }
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
    if (_contentHeight == null || _footerHeight == null) return;
    const stickyThreshold = 160;
    final offset = _scrollController.offset;
    double newSticky =
        offset >= stickyThreshold ? offset - stickyThreshold : 0.0;
    final maxSticky =
        (_contentHeight! + _footerHeight!) - MediaQuery.of(context).size.height;
    if (maxSticky > 0 && newSticky > maxSticky) newSticky = maxSticky;
    if (newSticky != stickyPosition.value) stickyPosition.value = newSticky;
  }

  void _updateActiveSection() {
    if (_isManualSelection) return;
    String? currentSectionId;
    sectionKeys.forEach((id, key) {
      final ctx = key.currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox;
        final pos = box.localToGlobal(Offset.zero).dy;
        if (pos - 120 <= 0) currentSectionId = id;
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
      _isManualSelection = true;
      _scrollController
          .animateTo(
            offset - 100,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          )
          .whenComplete(() => _isManualSelection = false);
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
          return ResponsiveBuilder(
            builder: (_, sizing) => sizing.isDesktop
                ? _desktopLayout(state, list, stickyPosition)
                : _mobileTabletLayout(state, list),
          );
        },
      ),
    );
  }

  Widget _desktopLayout(
    PrivacyState state,
    List<PrivacyPolicyList> list,
    ValueNotifier<double> stickyPosition,
  ) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, homeState) {
        return SizedBox(
          width: Constants.width,
          height: getResponsiveHeight(homeState.isTopContainerVisible),
          child: Stack(
            children: [
              /// Scrollable content
              Positioned.fill(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      SizedBox(
                        width: getValueForScreenType<double>(
                          context: context,
                          mobile: Constants.width * 0.96,
                          tablet: Constants.width * 0.92,
                          desktop: Constants.desktopBreakPoint,
                        ),
                        child: PolicyDesktopBody(
                          key: _policyBodyKey,
                          sectionKeys: sectionKeys,
                          policiesList: list,
                          scrollToSection: scrollToSection,
                        ),
                      ),
                      FooterScreen(key: _footerKey),
                    ],
                  ),
                ),
              ),

              /// Floating TOC
              ValueListenableBuilder<double>(
                valueListenable: stickyPosition,
                builder: (_, pos, __) {
                  return Positioned(
                    top: homeState.isTopContainerVisible ? 160 : 20,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: SizedBox(
                        width: Constants.desktopBreakPoint,
                        child: Row(
                          children: [
                            Expanded(child: SizedBox()),
                            SizedBox(
                              width: 250,
                              height: getPositionedHeight(list, state),
                              child: TableOfContentsWidget(
                                policiesList: list,
                                sectionKeys: sectionKeys,
                                onTapSection: scrollToSection,
                                tocScrollController: _tocScrollController,
                                footerHeight: _footerHeight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  double getResponsiveHeight(bool isTopVisible) {
    if (Constants.width < 1400) {
      return Constants.height * (isTopVisible ? 0.79 : 0.88);
    } else if (Constants.width < 1600) {
      return Constants.height * (isTopVisible ? 0.82 : 0.9);
    } else if (Constants.width < 2400) {
      return Constants.height * (isTopVisible ? 0.85 : 0.91);
    } else if (Constants.width > 2400) {
      return Constants.height * (isTopVisible ? 0.91 : 0.95);
    } else {
      return Constants.height * (isTopVisible ? 0.85 : 0.95);
    }
  }

  double getPositionedHeight(
    List<PrivacyPolicyList> list,
    PrivacyState state,
  ) {
    if (Constants.width < 1300) {
      for (int i = 0; i < list.length; i++) {
        final parent = list[i];
        final parentTitle = parent.privPolicyPointsHd ?? '';
        final isActive = state.selectedItem == parentTitle;

        // If current item is active
        if (isActive) {
          final isInLastThree = i >= list.length - 2;
          return isInLastThree ? 80 : Constants.height;
        }
      }
      return Constants.height * .8;
    } else if (Constants.width < 1400) {
      for (int i = 0; i < list.length; i++) {
        final parent = list[i];
        final parentTitle = parent.privPolicyPointsHd ?? '';
        final isActive = state.selectedItem == parentTitle;

        // If current item is active
        if (isActive) {
          final isInLastThree = i >= list.length - 3;
          return isInLastThree ? 150 : Constants.height;
        }
      }
      return Constants.height * .8;
    } else if (Constants.width < 1600) {
      for (int i = 0; i < list.length; i++) {
        final parent = list[i];
        final parentTitle = parent.privPolicyPointsHd ?? '';
        final isActive = state.selectedItem == parentTitle;

        // If current item is active
        if (isActive) {
          final isInLastThree = i >= list.length - 3;
          return isInLastThree ? 200 : Constants.height;
        }
      }
      return Constants.height;
    } else if (Constants.width < 1800) {
      for (int i = 0; i < list.length; i++) {
        final parent = list[i];
        final parentTitle = parent.privPolicyPointsHd ?? '';
        final isActive = state.selectedItem == parentTitle;

        // If current item is active
        if (isActive) {
          final isInLastThree = i >= list.length - 3;
          return isInLastThree ? 250 : Constants.height;
        }
      }
      return Constants.height * .8;
    } else if (Constants.width < 2400) {
      for (int i = 0; i < list.length; i++) {
        final parent = list[i];
        final parentTitle = parent.privPolicyPointsHd ?? '';
        final isActive = state.selectedItem == parentTitle;

        // If current item is active
        if (isActive) {
          final isInLastThree = i >= list.length - 4;
          return isInLastThree ? 400 : Constants.height;
        }
      }
      return Constants.height * .9;
    } else if (Constants.width < 3100) {
      for (int i = 0; i < list.length; i++) {
        final parent = list[i];
        final parentTitle = parent.privPolicyPointsHd ?? '';
        final isActive = state.selectedItem == parentTitle;

        // If current item is active
        if (isActive) {
          final isInLastThree = i >= list.length - 6;
          return isInLastThree ? Constants.height * .6 : Constants.height;
        }
      }
      return Constants.height * .9;
    } else if (Constants.width > 3100) {
      return Constants.height;
    } else {
      return (_scrollController.offset < 6500) ? Constants.height : 200;
    }
  }

  Widget _mobileTabletLayout(PrivacyState state, List<PrivacyPolicyList> list) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: Constants.width * .92,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: HeaderWidget(text: state.data?.secHeader ?? '')),
                  Gap(20),
                  TableOfContentsWidget(
                    policiesList: list,
                    sectionKeys: sectionKeys,
                    onTapSection: scrollToSection,
                    tocScrollController: _tocScrollController,
                    footerHeight: _footerHeight,
                  ),
                  Gap(20),
                  PolicyPoints(sectionKeys: sectionKeys),
                  Gap(20),
                ],
              ),
            ),
          ),
          FooterScreen(key: _footerKey),
        ],
      ),
    );
  }
}
