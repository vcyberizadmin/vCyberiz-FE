import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/data/model/search_model/search_model.dart';

class SearchResultsList extends StatelessWidget {
  final List<Hit> hits;
  final String query;

  const SearchResultsList({
    super.key,
    required this.hits,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty) {
      return SizedBox();
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Results for ',
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                  fontFamily: Constants.font,
                ),
                children: [
                  TextSpan(
                    text: query,
                    style: const TextStyle(
                      color: AppColors.orange,
                      fontWeight: FontWeight.bold,
                      fontFamily: Constants.font,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: getValueForScreenType(
                context: context,
                mobile: 300,
                tablet: 300,
                desktop: 350,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: hits.length,
                itemBuilder: (context, index) {
                  Hit hit = hits[index];
                  String title = hit.eventTitle ??
                      hit.secHeader ??
                      hit.title ??
                      hit.name ??
                      hit.heading ??
                      '';
                  final desc = hit.secDescription ??
                      hit.description ??
                      hit.bio ??
                      hit.content ??
                      hit.searchDescription ??
                      hit.secLabel ??
                      '';
                  if (title.isEmpty && desc.isEmpty) {
                    return SizedBox();
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      onTap: () {
                        if (hit.innerPageRequired == true) {
                          context.goNamed(
                            hit.globalUrl,
                            queryParameters: {
                              'id': hit.documentId,
                            },
                          );
                        } else {
                          context.goNamed(hit.globalUrl);
                        }
                        context.pop();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kStyle.bold(
                            text: title,
                            size: 16,
                            color: AppColors.blue,
                            overflow: TextOverflow.visible,
                          ),
                          Gap(10),
                          kStyle.med(
                            text: desc.trim(),
                            size: 14,
                            color: AppColors.darkBlue,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
