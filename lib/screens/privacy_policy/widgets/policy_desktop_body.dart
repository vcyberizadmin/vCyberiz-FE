import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vcyberiz/data/model/privacy_model/privacy_model.dart';
import 'package:vcyberiz/screens/privacy_policy/widgets/policy_page.dart';
import 'package:vcyberiz/screens/privacy_policy/widgets/table_of_content.dart';

import '../../../bloc/home-bloc/home_bloc.dart';
import '../../../bloc/home-bloc/home_state.dart';

class PolicyDesktopBody extends StatelessWidget {
  const PolicyDesktopBody({
    super.key,
    required this.stickyPosition,
    required this.sectionKeys,
    required this.policiesList,
    required this.scrollToSection,
    required this.tocScrollController,
    this.footerHeight,
  });

  final ValueNotifier<double> stickyPosition;
  final Map<String, GlobalKey> sectionKeys;
  final List<PrivacyPolicyList> policiesList;
  final Function(GlobalKey) scrollToSection;
  final ScrollController tocScrollController;
  final double? footerHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: PolicyPoints(sectionKeys: sectionKeys)),
            const Gap(60),
            const SizedBox(width: 250),
          ],
        ),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, homeState) {
            return ValueListenableBuilder<double>(
              valueListenable: stickyPosition,
              builder: (_, pos, __) => Positioned(
                top: homeState.isTopContainerVisible ? 160 : 40,
                right: 0,
                child: SizedBox(
                  width: 250,
                  height: MediaQuery.of(context).size.height - 160,
                  child: TableOfContentsWidget(
                    policiesList: policiesList,
                    sectionKeys: sectionKeys,
                    onTapSection: scrollToSection,
                    tocScrollController: tocScrollController,
                    footerHeight: footerHeight,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
