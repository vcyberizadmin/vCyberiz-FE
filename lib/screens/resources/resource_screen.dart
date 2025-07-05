// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcyberiz/bloc/blogs_bloc/blogs_bloc.dart';
import 'package:vcyberiz/bloc/events_bloc/events_bloc.dart';
import 'package:vcyberiz/bloc/news_bloc/news_bloc.dart';
import 'package:vcyberiz/bloc/resources_bloc/resources_bloc.dart';
import 'package:vcyberiz/core/utils/global_widgets/headingWidget.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';
import 'package:vcyberiz/screens/resources/widgets/ebook_widget.dart';

import '../../bloc/footer_bloc/footer_bloc.dart';
import '../../bloc/headers_bloc/headers_bloc.dart';
import '../../bloc/home-bloc/home_bloc.dart';
import '../../bloc/home-bloc/home_event.dart';
import '../base_view/widget/footer/footer_screen.dart';
import 'widgets/featured_blogs.dart';
import 'widgets/latest_news.dart';
import 'widgets/upcoming_events.dart';

class ResourceScreen extends StatefulWidget {
  const ResourceScreen({super.key});

  @override
  State<ResourceScreen> createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<HeadersBloc>().add(const GetHeaderDataEvent());
    context.read<FooterBloc>().add(const GetFooterEvent());
    context.read<ResourcesBloc>().add(const GetResourceHeaderDataEvent());
    context.read<BlogsBloc>().add(const GetBlogsListEvent());
    context.read<EventsBloc>().add(const GetEventsListEvent());
    context.read<NewsBloc>().add(const GetNewsListEvent());
    context.read<NewsBloc>().add(const GetEbookListEvent());

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
      child: BlocBuilder<ResourcesBloc, ResourcesState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //!-----------------( solution Heading)
                HeadingWidget(
                  text: state.headerData?.secHeader ?? '',
                  image: state.headerData?.secBgImg?.url ?? '',
                ),
                FeaturedBlogs(),
                LatestNews(),
                UpcomingEvents(),
                EbookWidget(),
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
