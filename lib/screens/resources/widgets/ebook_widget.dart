import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcyberiz/bloc/news_bloc/news_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/data/model/ebook_model/ebook_model.dart';

class EbookWidget extends StatelessWidget {
  const EbookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getValueForScreenType<double>(
        context: context,
        mobile: Constants.width * .96,
        tablet: Constants.width * .92,
        desktop: Constants.desktopBreakPoint,
      ),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          final ebooks = state.ebookList ?? [];

          if (ebooks.isEmpty) return const SizedBox.shrink();

          final deviceType = getDeviceType(MediaQuery.of(context).size);

          int crossAxisCount;
          double aspectRatio;

          switch (deviceType) {
            case DeviceScreenType.mobile:
              crossAxisCount = 1;
              aspectRatio = 3.2;
              break;
            case DeviceScreenType.tablet:
              crossAxisCount = 2;
              aspectRatio = 3.8;
              break;
            case DeviceScreenType.desktop:
            default:
              crossAxisCount = 3;
              aspectRatio = 4.5;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kStyle.med(
                text: 'Ebooks',
                size: 20,
              ),
              const Gap(20),
              GridView.builder(
                itemCount: ebooks.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: aspectRatio,
                ),
                itemBuilder: (context, index) {
                  EBookCard ebook = ebooks[index];
                  return InkWell(
                    onTap: () async {
                      final uri = Uri.parse(ebook.secLink?.href ?? '');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Could not launch ${ebook.secLink?.href ?? ''}';
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              ebook.secImg?.url ?? '',
                              width: 50,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Gap(12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ebook.secHeader ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                const Gap(8),
                                GestureDetector(
                                  onTap: () {
                                    // Handle download
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        ebook.secLink?.label ?? '',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.orange,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_right_alt,
                                        color: Colors.orange,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
    //  return ResponsiveBuilder(builder: (context, sizingInformation) {
    //               if (sizingInformation.isMobile) {
    //                 return Column(
    //                   children: [
    //                     SizedBox(
    //                       height: 400,
    //                       width: double.infinity,
    //                       child: Stack(
    //                         children: [
    //                           CarouselSlider.builder(
    //                             carouselController: controller,
    //                             itemCount:
    //                                 state.data!.data?.carousel?.length ?? 0,
    //                             options: CarouselOptions(
    //                               viewportFraction: 1.0,
    //                               height: 400,
    //                               autoPlay: true,
    //                               autoPlayInterval: const Duration(seconds: 10),
    //                               enlargeCenterPage: false,
    //                               scrollDirection: Axis.horizontal,
    //                               scrollPhysics: const ClampingScrollPhysics(),
    //                               onPageChanged: (index, reason) {
    //                                 context
    //                                     .read<SliderBloc>()
    //                                     .add(SliderChanged(sliderIndex: index));
    //                               },
    //                             ),
    //                             itemBuilder: (context, index, realIdx) {
    //                               return SizedBox(
    //                                 height: 400,
    //                                 child: Stack(
    //                                   children: [
    //                                     Positioned.fill(
    //                                       child: VideoPlayerWidget(
    //                                         videoUrl: state
    //                                                 .data!
    //                                                 .data
    //                                                 ?.carousel?[index]
    //                                                 .videoUrl ??
    //                                             '',
    //                                         placeholderWidget:
    //                                             Container(color: Colors.black),
    //                                         fit: BoxFit.fitHeight,
    //                                       ),
    //                                     ),
    //                                     _carouselContent(
    //                                         context, state.data!, index),
    //                                   ],
    //                                 ),
    //                               );
    //                             },
    //                           ),

    //                           // Slide indicator
    //                           Positioned(
    //                             bottom: getValueForScreenType(
    //                               context: context,
    //                               mobile: 20,
    //                               tablet: 20,
    //                             ),
    //                             left: 0,
    //                             right: 0,
    //                             child: slideIndicatorWidget(
    //                               state.data?.data?.carousel?.length ?? 0,
    //                               state.sliderIndex,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),

    //                     // Info section below the carousel
    //                     Padding(
    //                       padding: const EdgeInsets.symmetric(vertical: 50),
    //                       child: SizedBox(
    //                         width: Constants.width * .96,
    //                         child: Column(
    //                           spacing: 10,
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: List.generate(
    //                             state.data?.data?.infoSection?.length ?? 0,
    //                             (infoIndex) => textWidget(
    //                               state.data?.data?.infoSection?[infoIndex]
    //                                       .infoTitle ??
    //                                   "",
    //                               state.data?.data?.infoSection?[infoIndex]
    //                                       .infoDetail ??
    //                                   "",
    //                               state.data?.data?.infoSection?[infoIndex]
    //                                       .publicationDate ??
    //                                   DateTime.now(),
    //                               infoIndex,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 );
    //               } else {
    //                 return Column(
    //                   children: [
    //                     Stack(
    //                       children: [
    //                         carouselSliderWidget(
    //                           context,
    //                           state.data!,
    //                         ),
    //                         if (getDeviceType(MediaQuery.of(context).size) ==
    //                             DeviceScreenType.desktop)
    //                           Positioned(
    //                             right: getValueForScreenType(
    //                               context: context,
    //                               mobile: 0,
    //                               tablet: 0,
    //                               desktop: 50,
    //                             ),
    //                             left: 50,
    //                             top: 0,
    //                             bottom: 0,
    //                             child: slideIndicatorWidget(
    //                               state.data?.data?.carousel?.length ?? 0,
    //                               state.sliderIndex,
    //                             ),
    //                           )
    //                         else
    //                           Positioned(
    //                             bottom: getValueForScreenType(
    //                               context: context,
    //                               mobile: 20,
    //                               tablet: 20,
    //                             ),
    //                             left: 0,
    //                             right: 0,
    //                             child: slideIndicatorWidget(
    //                               state.data?.data?.carousel?.length ?? 0,
    //                               state.sliderIndex,
    //                             ),
    //                           ),
    //                       ],
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.symmetric(
    //                         vertical: 100,
    //                         horizontal: 100,
    //                       ),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: List.generate(
    //                           state.data?.data?.infoSection?.length ?? 0,
    //                           (infoIndex) => textWidget(
    //                             state.data?.data?.infoSection?[infoIndex]
    //                                     .infoTitle ??
    //                                 "",
    //                             state.data?.data?.infoSection?[infoIndex]
    //                                     .infoDetail ??
    //                                 "",
    //                             state.data?.data?.infoSection?[infoIndex]
    //                                     .publicationDate ??
    //                                 DateTime.now(),
    //                             infoIndex,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 );
    //               }
    //             });
           