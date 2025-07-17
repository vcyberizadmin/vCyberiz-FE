// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/careers_bloc/careers_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';
import 'package:vcyberiz/screens/base_view/widget/footer/footer_screen.dart';
import 'package:vcyberiz/screens/career_details_screen/widgets/job_heading.dart';
import 'package:vcyberiz/screens/career_details_screen/widgets/job_title%20card.dart';
import 'package:vcyberiz/screens/career_details_screen/widgets/submit_section.dart';

import 'widgets/essential_skills.dart';
import 'widgets/skills_widget.dart';

class CareerDetailsScreen extends StatefulWidget {
  final String documentId;
  const CareerDetailsScreen({
    super.key,
    required this.documentId,
  });

  @override
  State<CareerDetailsScreen> createState() => _CareerDetailsScreenState();
}

class _CareerDetailsScreenState extends State<CareerDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _careerDataKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();
  double _stickyPosition = 0.0;
  double? _blogListHeight = 0;
  double? _footerHeight = 0;
  @override
  void initState() {
    super.initState();
    context.read<CareersBloc>().add(GetCareerDetailsEvent(
          documentId: widget.documentId,
        ));

    _scrollController.addListener(() {
      if (_blogListHeight == 0 || _footerHeight == 0) {
        _measureHeights();
      }
      _updateStickyPosition();
      final isVisible = _scrollController.offset <= 70;
      context.read<HomeBloc>().add(ToggleIsTopContainerVisible(isVisible));
    });
  }

  void _measureWidgetHeight(
    GlobalKey key,
    Function(double) updateHeight,
  ) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      updateHeight(
        renderBox.size.height,
      );
    }
  }

  ///measure blogList Height
  void _measureHeights() {
    _measureWidgetHeight(
      _careerDataKey,
      (height) => setState(
        () => _blogListHeight = height,
      ),
    );

    ///measure footer Height
    _measureWidgetHeight(
      _footerKey,
      (height) => setState(
        () => _footerHeight = height,
      ),
    );
  }

  ///update sticky position
  void _updateStickyPosition() {
    const stickyThreshold = 400; // Height of the header
    final double offset = _scrollController.offset;

    if (offset < stickyThreshold) {
      setState(
        () => _stickyPosition = 0.0,
      );
      return;
    }

    if (offset <= ((_blogListHeight ?? 0) + (_footerHeight ?? 0))) {
      setState(
        () => _stickyPosition = offset - stickyThreshold,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: BlocBuilder<CareersBloc, CareersState>(
        builder: (context, state) {
          log((state.careerData?.zipCode).toString(), name: 'text');
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    if (sizingInformation.isMobile) {
                      return _mobileLayout(
                        context,
                        state,
                      ); // Mobile layout
                    } else if (sizingInformation.isTablet) {
                      return _tabletLayout(
                        context,
                        state,
                      ); // Tablet layout
                    } else {
                      return _desktopTabletLayout(
                        context,
                        state,
                      ); // Desktop layout
                    }
                  },
                ),
                FooterScreen(
                  key: _footerKey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _mobileLayout(
    BuildContext context,
    CareersState state,
  ) {
    return SizedBox(
      width: Constants.width,
      child: Column(
        spacing: 10,
        children: [
          JobDescriptionWidget(),
          JobTitleCard(
            state: state,
          ),
          EsseintialSkillsSection(
            state: state,
          ),
          SkillsCard(skills: state.careerData?.skills ?? []),
          ApplicationForm(),
        ],
      ),
    );
  }

  Widget _tabletLayout(
    BuildContext context,
    CareersState state,
  ) {
    return Container(
      color: AppColors.backGroundColor,
      width: Constants.width,
      child: SizedBox(
        width: getValueForScreenType<double>(
          context: context,
          mobile: Constants.width * 0.96,
          tablet: Constants.width * 0.92,
          desktop: Constants.desktopBreakPoint,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(50),
              const JobDescriptionWidget(),
              const Gap(20),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(20),
                        JobTitleCard(
                          state: state,
                        ),
                        Gap(20),
                        EsseintialSkillsSection(
                          state: state,
                        ),
                        SkillsCard(skills: state.careerData?.skills ?? []),
                      ],
                    ),
                  ),
                  const Gap(30),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Gap(getValueForScreenType(
                            context: context,
                            mobile: 10,
                            desktop: 140,
                            tablet: 10)),
                        ApplicationForm(),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _desktopTabletLayout(
    BuildContext context,
    CareersState state,
  ) {
    return Container(
      color: AppColors.backGroundColor,
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(50),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    key: _careerDataKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        JobDescriptionWidget(),
                        Gap(20),
                        JobTitleCard(
                          state: state,
                        ),
                        Gap(20),
                        EsseintialSkillsSection(
                          state: state,
                        ),
                        SkillsCard(skills: state.careerData?.skills ?? []),
                      ],
                    ),
                  ),
                  Gap(20),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          height: _stickyPosition,
                        ),
                        ApplicationForm(),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
