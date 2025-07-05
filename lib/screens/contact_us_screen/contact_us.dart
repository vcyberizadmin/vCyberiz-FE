// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/contact_us_bloc/contact_us_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/bloc/login/login_bloc.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/global_widgets/headingWidget.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/global_widgets/recaptcha_section.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/styles/font_constants.dart';
import 'package:vcyberiz/routes/route_constants.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';
import 'package:vcyberiz/screens/base_view/widget/footer/footer_screen.dart';
import 'package:vcyberiz/screens/contact_us_screen/widgets/custom_drop_down_field.dart';
import 'package:vcyberiz/screens/contact_us_screen/widgets/custom_textfield.dart';

import '../../core/utils/config/config.dart';
import 'widgets/globe_widget.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController businessEmail = TextEditingController();
  final TextEditingController companyName = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController interested = TextEditingController();
  final TextEditingController message = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Safe to trigger BLoC events in initState
    context.read<ContactUsBloc>().add(const GetContactUsHeaderEvent());
    context.read<ContactUsBloc>().add(const GetContactUsBannerEvent());
    context.read<ContactUsBloc>().add(const GetOurLocationsEvent());
    context.read<LoginBloc>().add(const LoginInit());

    // Scroll listener
    _scrollController.addListener(() {
      final isVisible = _scrollController.offset <= 70;
      context.read<HomeBloc>().add(ToggleIsTopContainerVisible(isVisible));
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
      child: SingleChildScrollView(
        controller: _scrollController,
        child: BlocBuilder<ContactUsBloc, ContactUsState>(
          builder: (context, state) {
            return Column(
              children: [
                HeadingWidget(
                  text: state.bannerData?.data.secHeader ?? "",
                  image: state.bannerData?.data.secBg.url ?? "",
                ),
                ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    if (sizingInformation.isMobile) {
                      return _mobileLayout(context);
                    } else {
                      return _desktopTabletLayout(context);
                    }
                  },
                ),
                const FooterScreen(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _mobileLayout(BuildContext context) {
    return SizedBox(
      width: Constants.width * .92,
      child: Column(
        spacing: 20,
        children: [
          const Gap(5),
          _contactUsContainer(context),
          _contactFormFields(context),
          const GlobeWidget(),
        ],
      ),
    );
  }

  Widget _desktopTabletLayout(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Constants.width,
          child: Center(
            child: SizedBox(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width * .96,
                tablet: Constants.width * .92,
                desktop: Constants.desktopBreakPoint,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getValueForScreenType(
                    context: context,
                    mobile: 0,
                    tablet: 0,
                    desktop: 50,
                  ),
                  vertical: 30,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _contactUsContainer(context),
                    ),
                    const Gap(50),
                    Expanded(
                      child: _contactFormFields(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const GlobeWidget(),
      ],
    );
  }

//!---------------------------contact us Container-----------------
  Widget _contactUsContainer(BuildContext context) {
    return BlocBuilder<ContactUsBloc, ContactUsState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kStyle.med(
              text: state.headerData?.textArea?.secHeader ?? '',
              size: getValueForScreenType(
                  context: context, mobile: 30, tablet: 40, desktop: 50),
              color: AppColors.black,
            ),
            const Gap(5),
            SizedBox(
              width: getValueForScreenType(
                  context: context, mobile: double.infinity, desktop: 350),
              child: kStyle.med(
                  text: state.headerData?.textArea?.secDescription ?? '',
                  overflow: TextOverflow.clip,
                  color: AppColors.davysGray,
                  size: getValueForScreenType(
                    context: context,
                    mobile: 14,
                    tablet: 14,
                    desktop: 14,
                  )),
            ),
            const Gap(30),
            Container(
              width: double.infinity,
              height: getValueForScreenType(
                context: context,
                mobile: 0,
                tablet: 0,
                desktop: 450,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                image: DecorationImage(
                  image: decorationImageProviderWidget(
                      state.headerData?.secBg?.url ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

//!----------------------------contact us form----------------
  Widget _contactFormFields(BuildContext context) {
    return BlocConsumer<ContactUsBloc, ContactUsState>(
      listener: (context, state) {
        if (state.submitStatus == SubmitStatus.success) {
          name.clear();
          businessEmail.clear();
          companyName.clear();
          country.clear();
          interested.clear();
          message.clear();
          context.read<LoginBloc>().add(const LoginInit());
        }
      },
      builder: (context, state) {
        return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, loginState) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      labelText: StringConst.name,
                      controller: name,
                      keyBoardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    CustomTextFormField(
                      labelText: StringConst.businessEmail,
                      controller: businessEmail,
                      keyBoardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email cannot be empty';
                        }
                        if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    CustomTextFormField(
                      labelText: StringConst.companyName,
                      controller: companyName,
                      keyBoardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Company name cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    CustomDropdownField(
                      label: StringConst.country,
                      items: Constants.countries,
                      controller: country,
                      hintText: "Select",
                      onItemSelected: (value) {
                        country.text = value;
                      },
                    ),
                    const Gap(16),
                    CustomDropdownField(
                      label: StringConst.iamInterested,
                      items: Constants.interestedItems,
                      controller: interested,
                      hintText: "Select",
                      onItemSelected: (value) {
                        interested.text = value;
                      },
                    ),
                    const Gap(16),
                    CustomTextFormField(
                      labelText: StringConst.message,
                      height: 100,
                      controller: message,
                      keyBoardType: TextInputType.text,
                      validator: null,
                      hintText: "Write your message",
                      maxLines: 3,
                    ),
                    if (state.error.isNotEmpty)
                      kStyle.reg(
                        text: StringConst.emailAlreadyExist,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        color: AppColors.white,
                        size: getValueForScreenType(
                          context: context,
                          mobile: 8,
                          tablet: 10,
                          desktop: 12,
                        ),
                      ),
                    const Gap(15),
                    ReCaptchaIntegration(
                      onChanged: (bool? value) {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(ReCaptchaTapEvent(
                                checkBoxValue: value ?? false,
                              ));
                          Timer(
                              const Duration(
                                seconds: 15,
                              ), () {
                            if (context.mounted) {
                              context
                                  .read<LoginBloc>()
                                  .add(const ReCaptchaTapEvent2(
                                    checkBoxValue: false,
                                  ));
                            }
                          });
                        }
                      },
                      isChecked: loginState.isReCaptchaChecked ?? false,
                    ),
                    Gap(15),
                    RichText(
                      text: TextSpan(
                        text: state.headerData?.secDescription
                                ?.split("Privacy Notice")
                                .first ??
                            '',
                        style: kStyle
                            .light(
                              text: '',
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.left,
                              color: AppColors.black,
                              size: getValueForScreenType(
                                context: context,
                                mobile: 12,
                                tablet: 12,
                                desktop: 12,
                              ),
                            )
                            .style,
                        children: [
                          TextSpan(
                              text: "Privacy Notice",
                              style: TextStyle(
                                fontFamily: Constants.font,
                                fontWeight: FontConst().lightFont,
                                overflow: TextOverflow.visible,
                                color: AppColors.black,
                                fontSize: getValueForScreenType(
                                  context: context,
                                  mobile: 12,
                                  tablet: 12,
                                  desktop: 12,
                                ),
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.black,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.goNamed(RouteConstants.privacyPath);
                                }),
                        ],
                      ),
                    ),
                    const Gap(20),
                    CustomButtonWidget(
                      width: double.infinity,
                      bgButtonColor: AppColors.orange,
                      text: state.headerData?.secCta?.label ?? '',
                      onTap: () {
                        if (formKey.currentState!.validate() &&
                            loginState.isReCaptchaChecked == true) {
                          context
                              .read<ContactUsBloc>()
                              .add(GetSubmitDetailsEvent(
                                name: name.text,
                                email: businessEmail.text,
                                companyName: companyName.text,
                                countryName: country.text,
                                comment: message.text,
                                interest: interested.text,
                              ));
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
