// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/bloc/our_service_bloc/our_service_bloc.dart';
import 'package:vcyberiz/core/utils/global_widgets/progress_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';

import '../../bloc/footer_bloc/footer_bloc.dart';
import '../../bloc/headers_bloc/headers_bloc.dart';
import '../base_view/widget/footer/footer_screen.dart';
import 'widgets/contact_us_today.dart';
import 'widgets/header_section.dart';
import 'widgets/key_focus_areas.dart';
import 'widgets/scope_of_service.dart';
import 'widgets/service_offerings.dart';
import 'widgets/why_this_service.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final String documentId;
  const ServiceDetailsScreen({
    super.key,
    required this.documentId,
  });

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<HeadersBloc>().add(const GetHeaderDataEvent());
    context.read<FooterBloc>().add(const GetFooterEvent());

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
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OurServiceBloc>().add(GetServicedetailsEvent(
            documentId: widget.documentId,
          ));
    });
    return BaseView(
      child: BlocBuilder<OurServiceBloc, OurServiceState>(
        builder: (context, state) {
          if (state.loading) {
            return SizedBox();
          }
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HeaderSection(),
                ScopeOfServiceSection(
                  documentId: widget.documentId,
                ),
                KeyFocusAreas(
                  documentId: widget.documentId,
                ),

                Divider(
                  color: AppColors.greyBorder,
                ),

                ServiceOfferings(
                  documentId: widget.documentId,
                ),
                WhyThisService(),
                ProgressWidget(
                  header:
                      state.serviceDetailsData?.innerPage?[4].secHeader ?? '',
                  label: state.serviceDetailsData?.innerPage?[4].secLabel ?? '',
                  bgImage: state.serviceDetailsData?.innerPage?[4].secBgImg
                          ?.first.url ??
                      '',
                  logoimage: state.serviceDetailsData?.innerPage?[4].secBgImg
                          ?.last.url ??
                      '',
                  items: state.serviceDetailsData?.innerPage?[4].secCard ?? [],
                ),
                ContactUsTodayWidget(),
                //!-------------------------(footer section)
                FooterScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
