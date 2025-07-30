// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/bloc/methodology_bloc/methodology_bloc.dart';
import 'package:vcyberiz/bloc/our_service_bloc/our_service_bloc.dart';
import 'package:vcyberiz/core/utils/global_widgets/headingWidget.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';

import '../../bloc/footer_bloc/footer_bloc.dart';
import '../../bloc/headers_bloc/headers_bloc.dart';
import '../base_view/widget/footer/footer_screen.dart';
import '../home/widgets/methodology_screen/methodology_widget.dart';
import 'widgets/service_tab_widget.dart';
import 'widgets/direct_approach.dart';

class ServiceSecurityScreen extends StatefulWidget {
  const ServiceSecurityScreen({super.key});

  @override
  State<ServiceSecurityScreen> createState() => _ServiceSecurityScreenState();
}

class _ServiceSecurityScreenState extends State<ServiceSecurityScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<HeadersBloc>().add(const GetHeaderDataEvent());
    context.read<FooterBloc>().add(const GetFooterEvent());
    context.read<OurServiceBloc>().add(const GetOurServiceHeaderEvent());
    context.read<OurServiceBloc>().add(const GetDirectApproachEvent());
    context.read<OurServiceBloc>().add(const GetOurServiceTabsEvent());
    context.read<MethodologyBloc>().add(const GetMethodologyDataEvent());
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
  Widget build(BuildContext context) {
    return BaseView(
      child: BlocBuilder<OurServiceBloc, OurServiceState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HeadingWidget(
                  text: state.serviceHeaderData?.secHeader ?? 'Our Services',
                  image: state.serviceHeaderData?.secBg?.url ??
                      '/data/uploads/aboutus/Images/Frame%202147227449.png',
                  label: state.serviceHeaderData?.secBg?.name ?? '',
                ), //!------------------------(Security consulting section)
                DirectApproachScreen(),
                //!----------------------(Pentagon section)
                ServiceTabWidget(),

                MethodologyWidget(),
                //!-------------------------(footer section)
                FooterScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
