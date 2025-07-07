import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vcyberiz/bloc/our_service_bloc/our_service_bloc.dart';
import 'package:vcyberiz/core/utils/global_widgets/know_more_widget.dart';
import 'package:vcyberiz/routes/route_constants.dart';

class ContactUsTodayWidget extends StatelessWidget {
  const ContactUsTodayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OurServiceBloc, OurServiceState>(
      builder: (context, state) {
        if ((state.serviceDetailsData?.innerPage ?? []).length <= 5) {
          return SizedBox();
        } else {
          if ((state.serviceDetailsData?.innerPage?[5].secImg?.url ?? '')
              .isEmpty) {
            return const SizedBox();
          }
          return KnowMoreWidget(
            videoUrl: state.serviceDetailsData?.innerPage?[5].secImg?.url ?? '',
            secondaryVideoUrl:
                state.serviceDetailsData?.innerPage?[5].secondaryVideoUrl ?? '',
            header: state.serviceDetailsData?.innerPage?[5].secHeader ?? '',
            buttonText:
                state.serviceDetailsData?.innerPage?[5].secCta?.label ?? '',
            onTap: () {
              context.goNamed(RouteConstants.contactUsScreenPath);
            },
          );
        }
      },
    );
  }
}
