// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vcyberiz/core/utils/global_widgets/headingWidget.dart';
import 'package:vcyberiz/routes/route_constants.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';

import '../../bloc/footer_bloc/footer_bloc.dart';
import '../../bloc/headers_bloc/headers_bloc.dart';
import '../../bloc/home-bloc/home_bloc.dart';
import '../../bloc/home-bloc/home_event.dart';
import '../../bloc/solutions_bloc/solutions_bloc.dart';
import '../base_view/widget/footer/footer_screen.dart';
import 'widgets/emergency_responce.dart';
import 'widgets/header_section.dart';
import 'widgets/microsoft_security.dart';
import '../../core/utils/global_widgets/know_more_widget.dart';

class SolutionsSection extends StatefulWidget {
  const SolutionsSection({super.key});

  @override
  State<SolutionsSection> createState() => _SolutionsSectionState();
}

class _SolutionsSectionState extends State<SolutionsSection> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<HeadersBloc>().add(const GetHeaderDataEvent());
    context.read<FooterBloc>().add(const GetFooterEvent());
    context.read<SolutionsBloc>().add(const GetHeaderEvent());
    context.read<SolutionsBloc>().add(const GetSolutionsWeOfferEvent());
    context.read<SolutionsBloc>().add(const GetWhatWeHaveDoneEvent());
    context.read<SolutionsBloc>().add(const GetSolutionsHeaderEvent());
    context.read<SolutionsBloc>().add(const GetEmergencyResponceApiEvent());
    context.read<SolutionsBloc>().add(const GetMicrosoftSecurityEvent());
    context.read<SolutionsBloc>().add(const GetNeedHelpApiEvent());

    super.initState();
    _scrollController.addListener(() {
      final isVisible = _scrollController.offset <= 70;
      if (isVisible) {
        context.read<HomeBloc>().add(ToggleIsTopContainerVisible(true));
      } else {
        context.read<HomeBloc>().add(ToggleIsTopContainerVisible(false));
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: BlocBuilder<SolutionsBloc, SolutionsState>(
        builder: (context, state) {
          if (state.loading) {
            return SizedBox.shrink();
          }
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //!-----------------( solution Heading)
                HeadingWidget(
                  text: state.headerData?.secHeader ?? '',
                  image: state.headerData?.bgImg?.url ?? '',
                  label: state.headerData?.bgImg?.name ?? '',
                ),
                HeaderSection(),
                MicrosoftSecurity(),
                EmergencyResponse(),
                KnowMoreWidget(
                  videoUrl: state.needHelpData?.section?.secImg?.url ?? '',
                  secondaryVideoUrl:
                      state.needHelpData?.section?.secondaryVideoUrl ?? '',
                  header: state.needHelpData?.section?.secHeader ?? '',
                  buttonText: state.needHelpData?.section?.secCta?.label ?? '',
                  onTap: () {
                    context.goNamed(RouteConstants.contactUsScreenPath);
                  },
                ),
                //!---------------------(Footer Section)
                const FooterScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
