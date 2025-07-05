// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';
import 'package:vcyberiz/routes/route_constants.dart';

import '../../../../bloc/footer_bloc/footer_bloc.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../data/model/footer_model/footer_model.dart';

class FooterCompanySection extends StatelessWidget {
  const FooterCompanySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FooterBloc, FooterState>(
      builder: (context, state) {
        return Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            //!---------------------(service)
            columnWidget(
                context,
                state.data?.siteMap?.platform?.referencesMap?.label ?? '',
                state.data?.siteMap?.platform?.referencesMap?.references,
                getValueForScreenType<double>(
                  context: context,
                  mobile: Constants.width,
                  tablet: 200,
                  desktop: Constants.desktopBreakPoint * .14,
                )),

            //!----------------(solution)
            column2Widget(
                context,
                state.data?.siteMap?.withUs?.label ?? '',
                state.data?.siteMap?.withUs?.references,
                getValueForScreenType<double>(
                  context: context,
                  mobile: Constants.width,
                  tablet: 250,
                  desktop: Constants.desktopBreakPoint * .23,
                )),
            //!----------------(company)
            column2Widget(
                context,
                state.data?.siteMap?.company?.referencesMap?.label ?? '',
                state.data?.siteMap?.company?.referencesMap?.references,
                getValueForScreenType<double>(
                  context: context,
                  mobile: Constants.width,
                  tablet: 200,
                  desktop: Constants.desktopBreakPoint * .14,
                )),
            //!----------------(subscribe)

            imageLogoWidget(state, context),
          ],
        );
      },
    );
  }

  Widget imageLogoWidget(
    FooterState state,
    BuildContext context,
  ) {
    TextEditingController emailController = TextEditingController();

    return BlocListener<FooterBloc, FooterState>(
      listener: (context, state) {
        if (state.subscribed) {
          emailController.clear();
        }
      },
      child: ResponsiveBuilder(builder: (
        context,
        sizingInformation,
      ) {
        if (sizingInformation.isMobile) {
          return SizedBox(
            width: Constants.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kstyles().bold(
                //   text: state.data?.subscribe?.title ?? '',
                //   color: AppColors.black,
                //   size: 18,
                // ),
                // Gap(20),
                // Container(
                //   decoration: BoxDecoration(
                //     color: AppColors.antiFlashWhite,
                //     borderRadius: BorderRadius.circular(
                //       30,
                //     ),
                //   ),
                //   height: 40,
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: TextFormField(
                //           controller: emailController,
                //           decoration: InputDecoration(
                //             hintText: "Enter Your Email Here",
                //             hintStyle: TextStyle(
                //               color: AppColors.davysGray,
                //               fontSize: 14,
                //             ),
                //             filled: true,
                //             fillColor: AppColors.antiFlashWhite,
                //             contentPadding: EdgeInsets.symmetric(
                //               vertical: getValueForScreenType(
                //                 context: context,
                //                 mobile: 5,
                //                 tablet: 10,
                //                 desktop: 15,
                //               ),
                //               horizontal: getValueForScreenType(
                //                 context: context,
                //                 mobile: 5,
                //                 tablet: 20,
                //                 desktop: 20,
                //               ),
                //             ),
                //             border: OutlineInputBorder(
                //               borderRadius: BorderRadius.horizontal(
                //                 left: Radius.circular(
                //                   30,
                //                 ),
                //               ),
                //               borderSide: BorderSide.none,
                //             ),
                //           ),
                //         ),
                //       ),
                //       buttonWidget(context, emailController, state),
                //     ],
                //   ),
                // ),
                // Gap(20),
                Kstyles().bold(
                  text: state.data?.siteMap?.connectHeader ?? '',
                  color: AppColors.black,
                  size: 18,
                ),
                Gap(10),
                iconsWidget(state), Gap(10),
              ],
            ),
          );
        } else if (sizingInformation.isTablet) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   width: getValueForScreenType<double>(
              //     context: context,
              //     mobile: 180,
              //     tablet: 320,
              //     desktop: Constants.desktopBreakPoint * .22,
              //   ),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Kstyles().bold(
              //         text: state.data?.subscribe?.title ?? '',
              //         color: AppColors.black,
              //         size: 18,
              //       ),
              //       Gap(20),
              //       Container(
              //         decoration: BoxDecoration(
              //           color: AppColors.antiFlashWhite,
              //           borderRadius: BorderRadius.circular(
              //             30,
              //           ),
              //         ),
              //         height: 40,
              //         child: Row(
              //           children: [
              //             Expanded(
              //               child: TextFormField(
              //                 controller: emailController,
              //                 decoration: InputDecoration(
              //                   hintText: "Enter Your Email Here",
              //                   hintStyle: TextStyle(
              //                     color: AppColors.davysGray,
              //                     fontSize: 14,
              //                   ),
              //                   filled: true,
              //                   fillColor: AppColors.antiFlashWhite,
              //                   contentPadding: EdgeInsets.symmetric(
              //                     vertical: 15,
              //                     horizontal: getValueForScreenType(
              //                       context: context,
              //                       mobile: 5,
              //                       tablet: 20,
              //                       desktop: 20,
              //                     ),
              //                   ),
              //                   border: OutlineInputBorder(
              //                     borderRadius: BorderRadius.horizontal(
              //                       left: Radius.circular(
              //                         30,
              //                       ),
              //                     ),
              //                     borderSide: BorderSide.none,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             buttonWidget(context, emailController, state),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Kstyles().bold(
                    text: state.data?.siteMap?.connectHeader ?? '',
                    color: AppColors.black,
                    size: 18,
                  ),
                  Gap(15),
                  iconsWidget(state),
                ],
              ),
              Gap(10),
            ],
          );
        } else {
          return SizedBox(
            width: getValueForScreenType<double>(
              context: context,
              mobile: 180,
              tablet: 320,
              desktop: Constants.desktopBreakPoint * .22,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kstyles().bold(
                //   text: state.data?.subscribe?.title ?? '',
                //   color: AppColors.black,
                //   size: getValueForScreenType<double>(
                //     context: context,
                //     mobile: 12,
                //     tablet: 14,
                //     desktop: 16,
                //   ),
                // ),
                // Gap(20),
                // Container(
                //   decoration: BoxDecoration(
                //     color: AppColors.antiFlashWhite,
                //     borderRadius: BorderRadius.circular(
                //       30,
                //     ),
                //   ),
                //   height: 40,
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: TextFormField(
                //           controller: emailController,
                //           decoration: InputDecoration(
                //             hintText: "Enter Your Email Here",
                //             hintStyle: TextStyle(
                //               color: AppColors.davysGray,
                //               fontSize: 14,
                //             ),
                //             filled: true,
                //             fillColor: AppColors.antiFlashWhite,
                //             contentPadding: EdgeInsets.symmetric(
                //               vertical: 15,
                //               horizontal: getValueForScreenType(
                //                 context: context,
                //                 mobile: 5,
                //                 tablet: 20,
                //                 desktop: 20,
                //               ),
                //             ),
                //             border: OutlineInputBorder(
                //               borderRadius: BorderRadius.horizontal(
                //                 left: Radius.circular(
                //                   30,
                //                 ),
                //               ),
                //               borderSide: BorderSide.none,
                //             ),
                //           ),
                //         ),
                //       ),
                //       buttonWidget(context, emailController, state),
                //     ],
                //   ),
                // ),
                // Gap(20),
                Kstyles().bold(
                  text: state.data?.siteMap?.connectHeader ?? '',
                  color: AppColors.black,
                  size: getValueForScreenType<double>(
                    context: context,
                    mobile: 12,
                    tablet: 14,
                    desktop: 16,
                  ),
                ),
                Gap(10),
                iconsWidget(state),
                Gap(10),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget iconsWidget(FooterState state) {
    const Map<String, String> socialUrls = {
      'facebook': 'https://m.facebook.com/vCyberiz/',
      'x': 'https://x.com/vCyberiz',
      'LinkedIn': 'https://www.linkedin.com/company/vcyberiz/',
    };
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...(state.data?.siteMap?.connect ?? []).map(
          (Brand data) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () async {
                  String url = socialUrls[data.link?.label ?? ''] ?? '';
                  final uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: CircleAvatar(
                  backgroundColor: AppColors.transparent,
                  radius: 15,
                  child: ImageWidget(
                    imageUrl: data.secLogo?.first.url ?? "",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buttonWidget(
    BuildContext context,
    TextEditingController emailController,
    FooterState state,
  ) {
    return CustomButtonWidget(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      text: state.data?.subscribe?.btnTitle ?? '',
      bgButtonColor: AppColors.darkOrangeColor,
      textSize: 14,
      onTap: () {
        context.read<FooterBloc>().add(
              SubscribeEvent(
                emailController.text,
              ),
            );
      },
    );
  }

  Widget columnWidget(
    BuildContext context,
    String heading,
    List<Cta>? columnList,
    double width,
  ) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Kstyles().bold(
            text: heading,
            size: 18,
            color: AppColors.black,
            overflow: TextOverflow.visible,
          ),
          const SizedBox(height: 10),
          ...(columnList ?? []).map(
            (Cta data) => InkWell(
              onTap: () {
                if (data.label == 'Contact Us') {
                  context.goNamed(RouteConstants.contactUsScreenPath);
                }
                if (data.label == 'About Us') {
                  context.goNamed(RouteConstants.aboutUsPath);
                }
                if (data.label == 'Partners') {
                  context.goNamed(RouteConstants.partnersScreenPath);
                }
                if (data.label == 'Career') {
                  context.goNamed(RouteConstants.careerScreenPath);
                }
                if (data.label == 'Resources') {
                  context.goNamed(RouteConstants.resourcePath);
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: kStyle.med(
                  overflow: TextOverflow.visible,
                  text: data.label ?? '',
                  size: 14,
                  color: AppColors.darkBlueText,
                ),
              ),
            ),
          ),
          Gap(20),
        ],
      ),
    );
  }

  Widget column2Widget(
    BuildContext context,
    String heading,
    List<Cta>? columnList,
    double width,
  ) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Kstyles().bold(
            text: heading,
            size: 18,
            color: AppColors.black,
            overflow: TextOverflow.visible,
          ),
          const SizedBox(height: 10),
          ...(columnList ?? []).map((Cta data) {
            String label = (data.label ?? '').trim();

            return InkWell(
              onTap: () {
                if (label == 'Cyber Maturity Assessment') {
                  context.goNamed(
                    RouteConstants.cyberMeturityPath,
                    queryParameters: {
                      'id': data.href ?? '',
                    },
                  );
                }
                if (label == 'Intelligence Led Penetration Testing') {
                  context.goNamed(
                    RouteConstants.penitraionTestingPath,
                    queryParameters: {
                      'id': data.href ?? '',
                    },
                  );
                }
                if (label == 'M365 Security Posture Advisory') {
                  context.goNamed(
                    RouteConstants.postureAdvisoryPath,
                    queryParameters: {
                      'id': data.href ?? '',
                    },
                  );
                }
                if (label == 'Managed 365 Security') {
                  context.goNamed(
                    RouteConstants.managedSecurityPath,
                    queryParameters: {
                      'id': data.href ?? '',
                    },
                  );
                }
                if (label == 'M365 Security Implementation') {
                  context.goNamed(
                    RouteConstants.securityImplementationPath,
                    queryParameters: {
                      'id': data.href ?? '',
                    },
                  );
                }
                if (label == 'vShield') {
                  context.goNamed(
                    RouteConstants.vshieldPath,
                    queryParameters: {
                      'id': data.href ?? '',
                    },
                  );
                }
                if (label == 'vArmor') {
                  context.goNamed(
                    RouteConstants.varmorPath,
                    queryParameters: {
                      'id': data.href ?? '',
                    },
                  );
                }
                if (label == 'vProtect') {
                  context.goNamed(
                    RouteConstants.vprotectPath,
                    queryParameters: {
                      'id': data.href ?? '',
                    },
                  );
                }
                if (label == 'vRespond') {
                  context.goNamed(
                    RouteConstants.vrespondPath,
                    queryParameters: {
                      'id': data.href ?? '',
                    },
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: kStyle.med(
                  overflow: TextOverflow.visible,
                  text: data.label ?? '',
                  size: 14,
                  color: AppColors.darkBlueText,
                ),
              ),
            );
          }),
          Gap(20),
        ],
      ),
    );
  }
}
