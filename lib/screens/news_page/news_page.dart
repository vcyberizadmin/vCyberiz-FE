import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/bloc/news_bloc/news_bloc.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/headingWidget.dart';
import 'package:vcyberiz/core/utils/global_widgets/pagination_widget.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';
import 'package:vcyberiz/screens/base_view/widget/footer/footer_screen.dart';

import 'widgets/news_card_list.dart';
import 'widgets/news_view.dart';
import 'widgets/search_section.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
    context.read<NewsBloc>().add(const GetNewsHeaderEvent());
    context.read<NewsBloc>().add(const GetNewsListEvent());
    context.read<NewsBloc>().add(const GetCategoryEvent());
    context.read<NewsBloc>().add(const GetAllTagsEvent());
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
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    if (sizingInformation.isDesktop) {
                      return _desktopLayout(context, state, _scrollController);
                    } else {
                      return _mobileTabletLayout(
                          context, state, _scrollController, sizingInformation);
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

//!------------------Desktop Section----------------

  Widget _desktopLayout(
    BuildContext context,
    NewsState state,
    ScrollController scrollController,
  ) {
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeadingWidget(
              text: state.headerData?.secHeader ?? 'News',
              image: state.headerData?.secBgImg?.url ??
                  '/data/uploads/Homepage/Images/Frame%202147227449.png',
              label: state.headerData?.secBgImg?.name ?? '',
            ),
            const Gap(60),
            NewsViewHome(
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
                  context.read<NewsBloc>().add(
                        GetPaginationDataEvent(
                          itemCount: getValueForScreenType(
                            context: context,
                            mobile: 4,
                            tablet: 4,
                            desktop: 5,
                          ),
                          searchText: searchController.text,
                          currentIndex: newPage,
                          dataList: state.newsList,
                          selectedCategory: state.selectedCategory,
                          selectedTags: state.selectedTags,
                        ),
                      );
                  _scrollController.jumpTo(420);
                },
              ),
          ],
        ),
      ),
    );
  }

//!-------------mobile and tablet section
  Widget _mobileTabletLayout(
    BuildContext context,
    NewsState state,
    ScrollController scrollController,
    SizingInformation sizingInformation,
  ) {
    return Column(
      children: [
        HeadingWidget(
          text: state.headerData?.secHeader ?? 'News',
          image: state.headerData?.secBgImg?.url ??
              '/data/uploads/Homepage/Images/Frame%202147227449.png',
          label: state.headerData?.secBgImg?.name ?? '',
        ),
        Gap(sizingInformation.isTablet ? 60 : 32),
        SizedBox(
          width: getValueForScreenType<double>(
            context: context,
            mobile: Constants.width * 0.92,
            tablet: Constants.width * 0.96,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: SearchWidget(
                  searchController: searchController,
                  scrollController: scrollController,
                ),
              ),
              if (sizingInformation.isTablet) const Spacer(flex: 2),
            ],
          ),
        ),
        Gap(sizingInformation.isTablet ? 40 : 24),
        Padding(
          padding: const EdgeInsets.all(12),
          child: NewsListSection(searchController: searchController),
        ),
        if (state.pagesCount > 1)
          PaginationControls(
            currentPage: state.currentPageIndex,
            totalPages: state.pagesCount,
            onPageChange: (newPage) {
              context.read<NewsBloc>().add(
                    GetPaginationDataEvent(
                      itemCount: getValueForScreenType(
                        context: context,
                        mobile: 4,
                        tablet: 4,
                        desktop: 5,
                      ),
                      searchText: searchController.text,
                      currentIndex: newPage,
                      dataList: state.newsList,
                      selectedCategory: state.selectedCategory,
                      selectedTags: state.selectedTags,
                    ),
                  );
              _scrollController.jumpTo(420);
            },
          ),
        SearchSectionNews(
          searchController: searchController,
          scrollController: scrollController,
        ),
        Gap(sizingInformation.isTablet ? 60 : 32),
      ],
    );
  }
}
