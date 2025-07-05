// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/hover_bloc/hover_bloc.dart';
import '../../../bloc/hover_bloc/hover_event.dart';
import '../../../bloc/hover_bloc/hover_state.dart';

class HoverView extends StatelessWidget {
  final Widget Function(bool isHovered) builder;

  HoverView({super.key, required this.builder});

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HoverViewBloc(),
      child: BlocBuilder<HoverViewBloc, HoverViewStates>(
          builder: (context, state) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            isHovered = true;
            context.read<HoverViewBloc>().add(MouseHovered(isHovered));
          },
          onExit: (_) {
            isHovered = false;
            context.read<HoverViewBloc>().add(MouseHovered(isHovered));
          },
          child: builder(isHovered),
        );
      }),
    );
  }
}
