import 'package:flutter/material.dart';
import 'package:vcyberiz/bloc/blogs_bloc/blogs_bloc.dart';

class SideBarWidget extends StatelessWidget {
  final BlogsState state;
  const SideBarWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Description Section
        Text(
          state.blogArticleData?.description ?? '',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }
}
