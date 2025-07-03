import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/bloc/news_bloc/news_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/data/model/news_model/news_article_model.dart';
import 'package:vcyberiz/routes/route_constants.dart';

import '../base_view/base_view.dart';
import '../base_view/widget/footer/footer_screen.dart';
import 'widgets/related_news.dart';
import 'widgets/share_screen_widget.dart';

class NewsArticleScreen extends StatefulWidget {
  final String documentId;
  const NewsArticleScreen({super.key, required this.documentId});

  @override
  State<NewsArticleScreen> createState() => _NewsArticleScreenState();
}

class _NewsArticleScreenState extends State<NewsArticleScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _newsListKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();
  double _stickyPosition = 0.0;
  double? _blogListHeight = 0;
  double? _footerHeight = 0;
  @override
  void initState() {
    super.initState();

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
      _newsListKey,
      (height) => setState(
        () => _blogListHeight = height - 300,
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
    const stickyThreshold = 560; // Height of the header
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsBloc>().add(GetNewsArticleEvent(widget.documentId));
      context.read<NewsBloc>().add(const GetMarketingEvent());
      context.read<NewsBloc>().add(const GetRelatedBlogsEvent());
    });
    return BaseView(
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return SizedBox(
            width: Constants.width,
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController, // Disable when needed
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(24),
                    _headerWidget(state),
                    SizedBox(
                      width: getValueForScreenType<double>(
                        context: context,
                        mobile: Constants.width * 0.92,
                        tablet: Constants.width * 0.92,
                        desktop: Constants.desktopBreakPoint,
                      ),
                      child: ResponsiveBuilder(
                        builder: (context, sizingInformation) {
                          if (sizingInformation.isDesktop) {
                            return _desktopLayout(
                                context, state, _scrollController);
                          } else {
                            return _tabletLayout(
                                context, state, _scrollController);
                          }
                        },
                      ),
                    ),
                    const Gap(20),

                    //!--------------------(Related Blog Section)
                    RelatedNewsWidget(
                      documentId: widget.documentId,
                    ),

                    const Gap(10),
                    //!-----------( Footer Section)
                    FooterScreen(
                      key: _footerKey,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _tabletLayout(
    BuildContext context,
    NewsState state,
    ScrollController scrollController,
  ) {
    return Column(
      children: [
        _dataWidget(
          context,
          state,
        ),
      ],
    );
  }

  Widget _desktopLayout(
    BuildContext context,
    NewsState state,
    ScrollController scrollController,
  ) {
    return SizedBox(
      width: getValueForScreenType<double>(
        context: context,
        mobile: Constants.width * 0.96,
        tablet: Constants.width * 0.92,
        desktop: Constants.desktopBreakPoint,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            key: _newsListKey,
            flex: 4,
            child: _dataWidget(
              context,
              state,
            ),
          ),
          const Gap(96),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  height: _stickyPosition,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: _positionedWidget(
                    context,
                    state,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _positionedWidget(
    BuildContext context,
    NewsState state,
  ) {
    return Container(
      width: double.infinity,
      height: getValueForScreenType(
        context: context,
        mobile: null,
        tablet: null,
        desktop: 500,
      ),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            state.blogMarketingList?.secCard?.secImg?.url ?? '',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: getValueForScreenType(
            context: context,
            mobile: CrossAxisAlignment.start,
            tablet: CrossAxisAlignment.start,
            desktop: CrossAxisAlignment.center,
          ),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kStyle.reg(
              text: state.blogMarketingList?.secCard?.secDescription ?? '',
              size: getValueForScreenType(
                context: context,
                mobile: 15,
                tablet: 16,
                desktop: 30,
              ),
              color: AppColors.white,
              overflow: TextOverflow.visible,
              textAlign: getValueForScreenType(
                context: context,
                mobile: TextAlign.start,
                tablet: TextAlign.start,
                desktop: TextAlign.center,
              ),
            ),
            const Gap(20),
            kStyle.reg(
              text: state.blogMarketingList?.secCard?.secHeader ?? '',
              size: getValueForScreenType(
                context: context,
                mobile: 12,
                tablet: 14,
                desktop: 25,
              ),
              color: AppColors.white,
              overflow: TextOverflow.visible,
              textAlign: getValueForScreenType(
                context: context,
                mobile: TextAlign.start,
                tablet: TextAlign.start,
                desktop: TextAlign.center,
              ),
            ),
            const Gap(20),
            Row(
              crossAxisAlignment: getValueForScreenType(
                context: context,
                mobile: CrossAxisAlignment.start,
                tablet: CrossAxisAlignment.start,
                desktop: CrossAxisAlignment.center,
              ),
              children: [
                CustomButtonWidget(
                  text: state.blogMarketingList?.secCard?.secCta?.label ?? "",
                  onTap: () {
                    context.goNamed(RouteConstants.contactUsScreenPath);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerWidget(NewsState state) {
    return SizedBox(
      width: getValueForScreenType<double>(
        context: context,
        mobile: Constants.width * 0.96,
        tablet: Constants.width * 0.92,
        desktop: Constants.desktopBreakPoint,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Section
          kStyle.bold(
            text: state.newsArticleData?.title ?? '',
            size: getValueForScreenType(
                context: context, mobile: 24, tablet: 24, desktop: 40),
            color: AppColors.darkBlueText,
            overflow: TextOverflow.visible,
          ),
          Gap(
            getValueForScreenType(
                context: context, mobile: 8, tablet: 16, desktop: 16),
          ),
          ShareScreenWidget(
            state: state,
          ),
          const SizedBox(height: 32),
          // Main Image
          Center(
            child: Container(
              height: getValueForScreenType(
                  context: context, mobile: 184, tablet: 330, desktop: 400),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    state.newsArticleData?.secImg?.url ?? '',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataWidget(BuildContext context, NewsState state) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(sizingInformation.isDesktop ? 60 : 30),
            kStyle.reg(
              text: state.newsArticleData?.description?.trim() ?? '',
              size: getValueForScreenType(
                  context: context, mobile: 14, tablet: 18, desktop: 18),
              color: AppColors.black,
              overflow: TextOverflow.visible,
            ),
            const Gap(24),
            //!-------------(Contact US Card)
            if (!sizingInformation.isDesktop) ...[
              if (sizingInformation.isTablet) _positionedWidget(context, state),
              const Gap(24),
            ],
            ListView.builder(
              shrinkWrap: true,
              itemCount: (state.newsArticleData?.newsSection ?? []).length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                NewsSection? data = state.newsArticleData?.newsSection?[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kStyle.med(
                      text: data?.header ?? '',
                      size: getValueForScreenType(
                          context: context,
                          mobile: 24,
                          tablet: 32,
                          desktop: 32),
                      color: AppColors.fontBlack,
                      overflow: TextOverflow.visible,
                    ),
                    const Gap(20),
                    // Paragraph
                    kStyle.reg(
                        text: data?.content?.trim() ?? '',
                        size: getValueForScreenType(
                            context: context,
                            mobile: 14,
                            tablet: 18,
                            desktop: 18),
                        color: AppColors.black,
                        overflow: TextOverflow.visible),
                    const Gap(20),
                    // Secondary Image
                    if ((data?.secImg ?? []).isNotEmpty) ...[
                      Container(
                        height: getValueForScreenType(
                            context: context,
                            mobile: 150,
                            tablet: 240,
                            desktop: 320),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              data?.secImg?.first.url ?? "",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Gap(24),
                    ]
                  ],
                );
              },
            ),
            Gap(10), tagsRelatedWidget(state.newsArticleData?.blogTags ?? []),
            Gap(10),
          ],
        );
      },
    );
  }

  Widget tagsRelatedWidget(List<Blog> tags) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kStyle.reg(
          text: "Tags Related",
          size: 16,
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: tags.map((tag) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: kStyle.reg(
                text: tag.name ?? '',
                size: 14,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
