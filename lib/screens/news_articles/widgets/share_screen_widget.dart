// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcyberiz/bloc/news_bloc/news_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class ShareScreenWidget extends StatefulWidget {
  final NewsState state;
  const ShareScreenWidget({super.key, required this.state});

  @override
  State<ShareScreenWidget> createState() => _ShareScreenWidgetState();
}

class _ShareScreenWidgetState extends State<ShareScreenWidget> {
  late String currentUrl;
  void _shareUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    currentUrl = Uri.base.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      currentUrl = Uri.base.toString();
      setState(() {});
    });
    return SizedBox(
      width: Constants.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          kStyle.med(
            text: widget.state.newsArticleData?.blogAuthor?.name ?? '',
            size: 15,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          const Text(
            "|",
            style: TextStyle(color: Colors.orange),
          ),
          const SizedBox(width: 8),
          kStyle.reg(
            text: DateFormat('MMMM yyyy').format(
                widget.state.newsArticleData?.publicationDate ??
                    DateTime.now()),
            size: 15,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          kStyle.reg(
            text: "|",
            size: 16,
            color: Colors.orange,
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              _showShareAlert(context, widget.state);
            },
            child: Row(
              children: [
                SizedBox(width: 4),
                kStyle.reg(
                  text: "Share",
                  color: Colors.grey,
                  size: 16,
                ),
                const Gap(4),
                Icon(Icons.share, color: Colors.grey, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showShareAlert(BuildContext context, NewsState state) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.all(16),
          content: SizedBox(
            width: 500,
            height: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kStyle.bold(
                  text: state.blogMarketingList?.secPopupCard?.secHeader ?? '',
                  size: 16,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.greyBackGround,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: kStyle.reg(
                          text: currentUrl,
                          size: 14,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    const Gap(10),
                    InkWell(
                      onTap: () {
                        // Copy the link to the clipboard
                        Clipboard.setData(
                          ClipboardData(text: currentUrl),
                        );
                        // Close the dialog and return to the previous screen
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.darkOrangeColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: kStyle.bold(
                          text: state.blogMarketingList?.secPopupCard?.secCta
                                  ?.label ??
                              '',
                          color: AppColors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                kStyle.bold(
                  text:
                      state.blogMarketingList?.secPopupCard?.secSubHeader ?? '',
                  size: 18,
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildShareButton(
                      state.blogMarketingList?.secPopupCard?.secLogo?[0].url ??
                          '',
                      "https://www.facebook.com/sharer/sharer.php?u=$currentUrl",
                      state.blogMarketingList?.secPopupCard?.secLogo?[0].name ??
                          '',
                    ),
                    _buildShareButton(
                      state.blogMarketingList?.secPopupCard?.secLogo?[1].url ??
                          '',
                      "https://www.linkedin.com/sharing/share-offsite/?url=$currentUrl",
                      state.blogMarketingList?.secPopupCard?.secLogo?[1].name ??
                          '',
                    ),
                    _buildShareButton(
                      state.blogMarketingList?.secPopupCard?.secLogo?[2].url ??
                          '',
                      "https://wa.me/?text=$currentUrl",
                      state.blogMarketingList?.secPopupCard?.secLogo?[2].name ??
                          '',
                    ),
                    _buildShareButton(
                      state.blogMarketingList?.secPopupCard?.secLogo?[3].url ??
                          '',
                      "mailto:?subject=Check this out!&body=$currentUrl",
                      state.blogMarketingList?.secPopupCard?.secLogo?[3].name ??
                          '',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildShareButton(
    String assetPath,
    String url,
    String label,
  ) {
    return IconButton(
      icon: ImageWidget(
        imageUrl: assetPath,
        label: label,
        width: 40,
        height: 40,
      ), // Use your icons
      onPressed: () => _shareUrl(url),
    );
  }
}
