// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/events_bloc/events_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/headingWidget.dart';
import 'package:vcyberiz/core/utils/global_widgets/pagination_widget.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';

import '../base_view/widget/footer/footer_screen.dart';
import 'widgets/events_list.dart';
import 'widgets/events_section.dart';
import 'widgets/search_section.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _blogListKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();
  double _stickyPosition = 0.0;
  double? _blogListHeight = 0;
  double? _footerHeight = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeBlocEvents();
    });

    super.initState();
    _scrollController.addListener(() {
      if (_blogListHeight == 0 || _footerHeight == 0) {
        _measureHeights();
      }
      final isVisible = _scrollController.offset <= 70;
      _updateStickyPosition();
      context.read<HomeBloc>().add(ToggleIsTopContainerVisible(isVisible));
    });
  }

  void _initializeBlocEvents() {
    context.read<EventsBloc>().add(const GetEventsHeaderEvent());
    context.read<EventsBloc>().add(const GetEventsListEvent());
    context.read<EventsBloc>().add(const GetCategoryEvent());
    context.read<EventsBloc>().add(const GetEventTagsEvent());
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
      _blogListKey,
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
    const stickyThreshold = 440; // Height of the header
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
      child: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    if (sizingInformation.isMobile) {
                      return _mobileLayout(context, state, _scrollController);
                    } else if (sizingInformation.isTablet) {
                      return _tabletLayout(context, state, _scrollController);
                    } else {
                      return _desktopLayout(context, state, _scrollController);
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

  //!---------------------Mobile Section----------------

  Widget _mobileLayout(BuildContext context, EventsState state,
      ScrollController scrollController) {
    return SizedBox(
      child: Column(
        children: [
          HeadingWidget(
            text: state.headerData?.secBody?.secHeader ?? '',
            image: state.headerData?.secBody?.secBg?.first.url ?? '',
          ),
          const Gap(32),
          SizedBox(
            width: Constants.width * 0.96,
            child: SearchWidget(
              searchController: searchController,
              scrollController: scrollController,
            ),
          ),
          const Gap(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: EventListSection(searchController: searchController),
          ),
          if (state.pagesCount > 1)
            PaginationControls(
              currentPage: state.currentPageIndex,
              totalPages: state.pagesCount,
              onPageChange: (newPage) {
                context.read<EventsBloc>().add(
                      GetPaginationDataEvent(
                        itemCount: getValueForScreenType(
                          context: context,
                          mobile: 4,
                          tablet: 4,
                          desktop: 7,
                        ),
                        searchText: searchController.text,
                        currentIndex: newPage,
                        dataList: state.eventsList,
                        selectedCategory: state.selectedCategory,
                        selectedTags: state.selectedTags,
                      ),
                    );
                _scrollController.jumpTo(420);
              },
            ),
          SearchSectionBlog(
            searchController: searchController,
            scrollController: scrollController,
          ),
          Gap(32),
        ],
      ),
    );
  }

//!------------------Desktoptablet Section----------------

  Widget _desktopLayout(
    BuildContext context,
    EventsState state,
    ScrollController scrollController,
  ) {
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeadingWidget(
              text: state.headerData?.secBody?.secHeader ?? '',
              image: state.headerData?.secBody?.secBg?.first.url ?? '',
            ),
            const Gap(60),
            EventsSection(
              blogListKey: _blogListKey,
              stickyPosition: _stickyPosition,
              searchController: searchController,
              scrollController: scrollController,
            ),
            if (state.pagesCount > 1)
              PaginationControls(
                currentPage: state.currentPageIndex,
                totalPages: state.pagesCount,
                onPageChange: (newPage) {
                  context.read<EventsBloc>().add(
                        GetPaginationDataEvent(
                          itemCount: getValueForScreenType(
                            context: context,
                            mobile: 4,
                            tablet: 4,
                            desktop: 7,
                          ),
                          searchText: searchController.text,
                          currentIndex: newPage,
                          dataList: state.eventsList,
                          selectedCategory: state.selectedCategory,
                          selectedTags: state.selectedTags,
                        ),
                      );
                  _scrollController.jumpTo(420);
                },
              ),
            const Gap(60),
          ],
        ),
      ),
    );
  }

//!-------------tablet section
  Widget _tabletLayout(
    BuildContext context,
    EventsState state,
    ScrollController scrollController,
  ) {
    return Column(
      children: [
        HeadingWidget(
          text: state.headerData?.secBody?.secHeader ?? '',
          image: state.headerData?.secBody?.secBg?.first.url ?? '',
        ),
        const Gap(60),
        SizedBox(
          width: Constants.width * 0.96,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: SearchWidget(
                  searchController: searchController,
                  scrollController: scrollController,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
        const Gap(40),
        Padding(
          padding: const EdgeInsets.all(12),
          child: EventListSection(searchController: searchController),
        ),
        if (state.pagesCount > 1)
          PaginationControls(
            currentPage: state.currentPageIndex,
            totalPages: state.pagesCount,
            onPageChange: (newPage) {
              context.read<EventsBloc>().add(
                    GetPaginationDataEvent(
                      itemCount: getValueForScreenType(
                        context: context,
                        mobile: 4,
                        tablet: 4,
                        desktop: 7,
                      ),
                      searchText: searchController.text,
                      currentIndex: newPage,
                      dataList: state.eventsList,
                      selectedCategory: state.selectedCategory,
                      selectedTags: state.selectedTags,
                    ),
                  );
              _scrollController.jumpTo(420);
            },
          ),
        SearchSectionBlog(
          searchController: searchController,
          scrollController: scrollController,
        ),
        Gap(60),
      ],
    );
  }
}
