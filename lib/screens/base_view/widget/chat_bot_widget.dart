// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../bloc/home-bloc/home_bloc.dart';
import '../../../bloc/home-bloc/home_event.dart';
import '../../../bloc/home-bloc/home_state.dart';
import '../../../core/utils/config/config.dart';
import '../../../core/utils/styles/app_colors.dart';

class ChatBotWidget extends StatelessWidget {
  const ChatBotWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (state.showChatContainer)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  closeButtonWidget(context),
                  const Gap(10),
                  messageBoxWidget(context),
                  const Gap(20),
                ],
              ),
            iconButtonWidget(context, state),
          ],
        );
      },
    );
  }

  Widget closeButtonWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeBloc>().add(
              ShowChatContainer(
                false,
              ),
            );
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.bluishGrey,
          boxShadow: [
            BoxShadow(
              color: AppColors.black,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: const Padding(
            padding: EdgeInsets.all(3),
            child: Icon(
              Icons.close,
              size: 10,
            )),
      ),
    );
  }

  Widget messageBoxWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.footerColor,
        borderRadius: BorderRadius.circular(3),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      width: 190,
      padding: const EdgeInsets.all(
        5,
      ),
      child: Center(
        child: kStyle.reg(
          text:
              "Explore Cybersecurity Awareness Month. Together, we'll work on staying safe.",
          overflow: TextOverflow.visible,
          color: AppColors.darkBlueText,
          size: 12,
        ),
      ),
    );
  }

  Widget iconButtonWidget(BuildContext context, HomeState state) {
    return InkWell(
      onTap: () {
        context.read<HomeBloc>().add(
              ShowChatContainer(
                !state.showChatContainer,
              ),
            );
      },
      child: Container(
        height: 45,
        width: 45,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.bluishGrey,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Image.asset(
            'assets/images/Vcyberiz_Icon.png',
          ),
        ),
      ),
    );
  }
}
