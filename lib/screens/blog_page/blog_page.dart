import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/blogs_bloc/blogs_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/headingWidget.dart';
import 'package:vcyberiz/core/utils/global_widgets/pagination_widget.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';
import 'package:vcyberiz/screens/base_view/widget/footer/footer_screen.dart';
import 'package:vcyberiz/screens/blog_page/widgets/blog_card_list.dart';
import 'package:vcyberiz/screens/blog_page/widgets/search_section.dart';

import 'widgets/blog_search_ui.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});
  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
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
    context.read<BlogsBloc>().add(const GetBlogsHeaderEvent());
    context.read<BlogsBloc>().add(const GetBlogsListEvent());
    context.read<BlogsBloc>().add(const GetBlogCategoryEvent());
    context.read<BlogsBloc>().add(const GetBlogTagsEvent());
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
      child: BlocBuilder<BlogsBloc, BlogsState>(
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
    BlogsState state,
    ScrollController scrollController,
  ) {
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeadingWidget(
              text: state.headerData?.secHeader?.secBg?.first.name ?? 'Blogs',
              image: state.headerData?.secHeader?.secBg?.first.url ??
                  "/data/uploads/Homepage/Images/Frame%202147227449.png",
              label: state.headerData?.secHeader?.secBg?.first.name ?? "",
            ),
            const Gap(60),
            BlogViewHome(
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
                  context.read<BlogsBloc>().add(
                        GetPaginationDataEvent(
                          itemCount: getValueForScreenType(
                            context: context,
                            mobile: 3,
                            tablet: 4,
                            desktop: 5,
                          ),
                          searchText: searchController.text,
                          currentIndex: newPage,
                          dataList: state.blogsList,
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

//!-------------Mobile & tablet section
  Widget _mobileTabletLayout(
    BuildContext context,
    BlogsState state,
    ScrollController scrollController,
    SizingInformation sizingInformation,
  ) {
    return Column(
      children: [
        HeadingWidget(
          text: state.headerData?.secHeader?.secBg?.first.name ?? 'Blogs',
          image: state.headerData?.secHeader?.secBg?.first.url ??
              "/data/uploads/Homepage/Images/Frame%202147227449.png",
          label: state.headerData?.secHeader?.secBg?.first.name ?? "",
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
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BlogListSection(searchController: searchController),
        ),
        if (state.pagesCount > 1)
          PaginationControls(
            currentPage: state.currentPageIndex,
            totalPages: state.pagesCount,
            onPageChange: (newPage) {
              context.read<BlogsBloc>().add(
                    GetPaginationDataEvent(
                      itemCount: getValueForScreenType(
                        context: context,
                        mobile: 3,
                        tablet: 4,
                        desktop: 5,
                      ),
                      searchText: searchController.text,
                      currentIndex: newPage,
                      dataList: state.blogsList,
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
        Gap(sizingInformation.isTablet ? 60 : 32),
      ],
    );
  }
}
