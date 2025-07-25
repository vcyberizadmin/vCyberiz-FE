// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/bloc/partners_bloc/partners_bloc.dart';
import 'package:vcyberiz/core/utils/global_widgets/headingWidget.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';
import 'package:vcyberiz/screens/base_view/widget/footer/footer_screen.dart';

import 'widgets/our_partners_tab_section.dart';
import 'widgets/partners_section.dart';

class PartnersScreen extends StatefulWidget {
  const PartnersScreen({super.key});

  @override
  State<PartnersScreen> createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<PartnersBloc>().add(const GetPartnersHeaderEvent());
    context.read<PartnersBloc>().add(const GetTechnologyPartnersEvent());
    context.read<PartnersBloc>().add(const GetSecureStrongFutureEvent());

    super.initState();
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
      child: BlocBuilder<PartnersBloc, PartnersState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                //!-----------header section
                HeadingWidget(
                  text: state.headerData?.secHeader ?? '',
                  image: state.headerData?.secBg?.url ?? '',
                  label: state.headerData?.secBg?.name ?? '',
                ),

                //!-----------technology section
                PartnersSection(),
                //!-----------ouSecuring stronger future
                OurPartnersTabSection(),

                //!-----------footer screen
                FooterScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
