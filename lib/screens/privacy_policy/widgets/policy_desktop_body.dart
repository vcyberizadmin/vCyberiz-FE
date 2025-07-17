import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vcyberiz/data/model/privacy_model/privacy_model.dart';
import 'package:vcyberiz/screens/privacy_policy/widgets/policy_page.dart';
import '../../../bloc/privacy_bloc/privacy_bloc.dart';
import 'header_widget.dart';

class PolicyDesktopBody extends StatelessWidget {
  const PolicyDesktopBody({
    super.key,
    required this.sectionKeys,
    required this.policiesList,
    required this.scrollToSection,
  });

  final Map<String, GlobalKey> sectionKeys;
  final List<PrivacyPolicyList> policiesList;
  final Function(GlobalKey) scrollToSection;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyBloc, PrivacyState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Main content area
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(60),
                  HeaderWidget(text: state.data?.secHeader ?? ''),
                  const Gap(40),
                  PolicyPoints(sectionKeys: sectionKeys),
                ],
              ),
            ),

            /// Right-side spacing placeholder for TOC (rendered outside)
            const Gap(60),
            const SizedBox(width: 250),
          ],
        );
      },
    );
  }
}
