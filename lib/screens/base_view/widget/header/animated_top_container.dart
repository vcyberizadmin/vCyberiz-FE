// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../../bloc/headers_bloc/headers_bloc.dart';
import '../../../../core/utils/constants/constants.dart';

class AnimatedTopContainer extends StatefulWidget {
  const AnimatedTopContainer({super.key});

  @override
  State<AnimatedTopContainer> createState() => _AnimatedTopContainerState();
}

class _AnimatedTopContainerState extends State<AnimatedTopContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _imageOffsetAnimation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _imageOffsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeadersBloc, HeadersState>(
      builder: (context, state) {
        if (state.loading) {
          return const SizedBox();
        }
        return ResponsiveBuilder(builder: (context, sizingInformation) {
          return Container(
            color: AppColors.darkBlue,
            child: Stack(
              children: [
                SlideTransition(
                  position: _imageOffsetAnimation,
                  child: Container(
                    height: 50,
                    width: Constants.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: AppColors.gradientColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: Constants.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColors.white,
                        ),
                        Expanded(
                          child: sizingInformation.isMobile
                              ? kStyle.med(
                                  text: state.loadingData?.first.info ?? '',
                                  color: AppColors.white,
                                  size: 10,
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.center,
                                )
                              : kStyle.reg(
                                  text: state.loadingData?.first.info ?? '',
                                  color: AppColors.white,
                                  size: getValueForScreenType(
                                    context: context,
                                    mobile: 10,
                                    tablet: 12,
                                    desktop: 14,
                                  ),
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
