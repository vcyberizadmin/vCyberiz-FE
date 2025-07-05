// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/core/utils/global_widgets/headingWidget.dart';
import 'package:vcyberiz/screens/about_vcyberiz/widgets/about_animated_section.dart';
import 'package:vcyberiz/screens/about_vcyberiz/widgets/about_maturity.dart';
import 'package:vcyberiz/screens/about_vcyberiz/widgets/about_vision.dart';
import 'package:vcyberiz/screens/about_vcyberiz/widgets/values_screen.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';
import 'package:vcyberiz/screens/base_view/widget/footer/footer_screen.dart';

import '../../bloc/about_us_bloc/about_us_bloc.dart';
import 'widgets/our_secrets.dart';

class NewAboutUsScreen extends StatefulWidget {
  const NewAboutUsScreen({super.key});

  @override
  State<NewAboutUsScreen> createState() => _NewAboutUsScreenState();
}

class _NewAboutUsScreenState extends State<NewAboutUsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isVisible = true;
  @override
  void initState() {
    context.read<AboutUsBloc>().add(const GetAboutUsHeaderEvent());
    context.read<AboutUsBloc>().add(const GetAboutUsShieldEvent());
    context.read<AboutUsBloc>().add(const GetAboutUsOurSecretsEvent());
    context.read<AboutUsBloc>().add(const GetAboutUsOurVisionEvent());
    context.read<AboutUsBloc>().add(const GetAboutUsOurValuesEvent());

    super.initState();
    _scrollController.addListener(() {
      isVisible = _scrollController.offset <= 70;
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
      child: BlocBuilder<AboutUsBloc, AboutUsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeadingWidget(
                  text: state.headerData?.secHeader ?? '',
                  image: state.headerData?.secBg?.url ?? '',
                ),
                //!---------(Shield sction)
                AboutAnimatedSection(),
                //!----------(Our secrets)
                OurSecrets(),
                //!----------(Values section)
                ValuesSection(),
                //!----------(About vision)
                AboutVisionSection(),

                AboutUsSecurityMaturitySection(),

                FooterScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
