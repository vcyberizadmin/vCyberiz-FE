import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/events_bloc/events_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';
import 'package:vcyberiz/screens/resources/widgets/upcoming_events.dart';

import '../../bloc/footer_bloc/footer_bloc.dart';
import '../../bloc/headers_bloc/headers_bloc.dart';
import '../base_view/widget/footer/footer_screen.dart';
import 'widgets/details_widget.dart';

class EventDetailsScreen extends StatefulWidget {
  final String documentId;
  const EventDetailsScreen({
    super.key,
    required this.documentId,
  });

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<HeadersBloc>().add(const GetHeaderDataEvent());
    context.read<FooterBloc>().add(const GetFooterEvent());
    // Add a listener to the scroll controller
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EventsBloc>().add(const GetRegisterDetailsEvent());
      context.read<EventsBloc>().add(GetEventdetailsEvent(
            documentId: widget.documentId,
          ));
    });
    return BaseView(
      child: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          if (state.loading) {
            return const SizedBox();
          }
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const DetailsWidget(), const Gap(20),

                const UpcomingEvents(),
                Gap(getValueForScreenType(
                    context: context, mobile: 32, tablet: 56, desktop: 72)),

                //!-------------------------(footer section)
                const FooterScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
