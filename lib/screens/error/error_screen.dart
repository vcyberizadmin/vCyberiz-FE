// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/footer_bloc/footer_bloc.dart';
import 'package:vcyberiz/bloc/headers_bloc/headers_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/asset_constants.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/routes/route_constants.dart';

import '../../bloc/home-bloc/home_event.dart';
import '../base_view/base_view.dart';
import '../base_view/widget/footer/footer_screen.dart';

class ErrorScreen extends StatefulWidget {
  final String error;
  final bool dataConnected;

  const ErrorScreen({
    super.key,
    required this.error,
    required this.dataConnected,
  });

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  final ScrollController _scrollController = ScrollController();
  // final double _opacity = 0.2; // Initial opacity for the gradient background.
  @override
  void initState() {
    super.initState();

    context.read<HeadersBloc>().add(const GetHeaderDataEvent());
    context.read<FooterBloc>().add(const GetFooterEvent());
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
      child: BlocBuilder<HeadersBloc, HeadersState>(
        builder: (context, state) {
          if (state.loading) {
            return SizedBox();
          }
          return SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              width: Constants.width,
              color: AppColors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    errorWidget(
                      StringConst.errorCode404,
                      StringConst.pageNotFound,
                      StringConst.pageDoesntExist,
                      StringConst.backToHome,
                      () {
                        context.goNamed(RouteConstants.homeScreenPath);
                      },
                    ),
                    //!--------------------(footer Section)
                    FooterScreen(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget errorWidget(
    String errorCode,
    String errorHeading,
    String errorDetails,
    String buttonText,
    Function()? onTap,
  ) {
    return Container(
      width: Constants.width,
      height: Constants.height,
      decoration: BoxDecoration(
          color: AppColors.blue,
          image: DecorationImage(
            image: AssetImage(
              getValueForScreenType(
                context: context,
                mobile: AssetConst.errorMobile,
                tablet: AssetConst.errorBg,
                desktop: AssetConst.errorBg,
              ),
            ),
            fit: BoxFit.cover,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kStyle.bold(
            text: errorCode,
            color: AppColors.white,
            size: 80,
          ),
          Gap(30),
          SizedBox(
            width: getValueForScreenType(
              context: context,
              mobile: Constants.width * .5,
              tablet: Constants.width * .5,
              desktop: Constants.width * .2,
            ),
            child: kStyle.reg(
              text: errorDetails,
              color: AppColors.white,
              size: 20,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
            ),
          ),
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonWidget(
                text: buttonText,
                onTap: onTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
