// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/careers_bloc/careers_bloc.dart';
import 'package:vcyberiz/core/utils/global_widgets/headingWidget.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';

import '../../bloc/home-bloc/home_bloc.dart';
import '../../bloc/home-bloc/home_event.dart';
import '../base_view/widget/footer/footer_screen.dart';
import 'widgets/career_vacancy_section.dart';
import '../../core/utils/global_widgets/pagination_widget.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  final ScrollController _scrollController = ScrollController();
  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    context.read<CareersBloc>().add(const GetCareersHeaderEvent());
    context.read<CareersBloc>().add(const GetCareerFilterDataEvent());

    super.initState();
    _scrollController.addListener(() {
      isVisible = _scrollController.offset <= 70;
      context.read<HomeBloc>().add(ToggleIsTopContainerVisible(isVisible));
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CareersBloc>().add(GetCareerListEvent(
              itemCount: getValueForScreenType(
            context: context,
            mobile: 5,
            desktop: 9,
            tablet: 6,
          )));
    });
    return BaseView(
      child: SingleChildScrollView(
        controller: _scrollController,
        child: BlocBuilder<CareersBloc, CareersState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HeadingWidget(
                  text: state.headerData?.pageBanner?.first.secHeader ?? '',
                  image: state.headerData?.pageBanner?.first.secBg?.first.url ??
                      '',
                  label:
                      state.headerData?.pageBanner?.first.secBg?.first.name ??
                          '',
                ), //!----------(Career vacancy section)
                CareerVacancySection(),
                if (state.pagesCount > 1)
                  PaginationControls(
                    currentPage: state.currentPageIndex,
                    totalPages: state.pagesCount,
                    onPageChange: (newPage) {
                      context.read<CareersBloc>().add(
                            GetPaginationDataEvent(
                              currentIndex: newPage,
                              dataList: state.careerList,
                              itemCount: getValueForScreenType(
                                context: context,
                                mobile: 3,
                                desktop: 9,
                                tablet: 6,
                              ),
                              search: state.searchText,
                              locationSearch: state.locationSearch,
                            ),
                          );
                      _scrollController.jumpTo(400);
                    },
                  ),
                Gap(20),
                //!----------(Footer)
                FooterScreen()
              ],
            );
          },
        ),
      ),
    );
  }
}
