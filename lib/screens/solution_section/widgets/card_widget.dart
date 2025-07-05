import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/routes/route_constants.dart';

import '../../../data/model/solutions_model/microsoft_security_model.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    required this.item,
  });

  final SecCard? item;

  final rightColumnKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.isMobile) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              ImageWidget(
                imageUrl: item?.secImg?.url ?? '',
                width: Constants.width,
                height: 250,
              ),
              const SizedBox(height: 20),

              // Text Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kStyle.med(
                    text: item?.secHeader ?? '',
                    size: getValueForScreenType(
                      context: context,
                      mobile: 20,
                      tablet: 24,
                      desktop: 32,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  const Gap(10),
                  kStyle.reg(
                    text: item?.secDescription ?? '',
                    size: getValueForScreenType(
                      context: context,
                      mobile: 16,
                      tablet: 16,
                      desktop: 20,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  const Gap(10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomButtonWidget(
                        showIcon: true,
                        text: item?.secCta?.label ?? '',
                        onTap: () {
                          context.goNamed(
                            RouteConstants.serviceDetailsPath,
                            queryParameters: {
                              'id': item?.secCta?.href ?? '',
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: getValueForScreenType(
            context: context,
            mobile: 20,
            tablet: 0,
            desktop: 100,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            ImageWidget(
              imageUrl: item?.secImg?.url ?? '',
              width: getValueForScreenType(
                  context: context, mobile: 0, tablet: 200, desktop: 300),
              fit: BoxFit.cover,
              height: getValueForScreenType(
                  context: context, mobile: 0, tablet: 200, desktop: 200),
            ),
            const SizedBox(width: 20),

            // Text Content
            Expanded(
              key: rightColumnKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kStyle.med(
                    text: item?.secHeader ?? '',
                    size: getValueForScreenType(
                      context: context,
                      mobile: 32,
                      tablet: 16,
                      desktop: 24,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  const Gap(15),
                  kStyle.reg(
                    text: item?.secDescription ?? '',
                    size: getValueForScreenType(
                        context: context, mobile: 20, tablet: 14, desktop: 14),
                    overflow: TextOverflow.visible,
                  ),
                  const Gap(15),
                  Row(
                    children: [
                      CustomButtonWidget(
                        showIcon: true,
                        text: item?.secCta?.label ?? '',
                        textSize: 12,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        onTap: () {
                          context.goNamed(
                            RouteConstants.serviceDetailsPath,
                            queryParameters: {
                              'id': item?.secCta?.href ?? '',
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
