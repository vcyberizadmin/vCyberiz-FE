// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcyberiz/bloc/blogs_bloc/blogs_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class ShareScreenWidget extends StatefulWidget {
  final BlogsState state;
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
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Constants.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          kStyle.med(
            text: widget.state.blogArticleData?.blogAuthor?.name ?? '',
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
                widget.state.blogArticleData?.publicationDate ??
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

  Future<dynamic> _showShareAlert(BuildContext context, BlogsState state) {
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
                    ...(state.blogMarketingList?.secPopupCard?.secLogo ?? [])
                        .map(
                      (cta) => _buildShareButton(
                        cta.url ?? '',
                        cta.name ?? '',
                        cta.label ?? '',
                        currentUrl,
                      ),
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

  String getShareUrlByLabel(String label, String currentUrl) {
    final encodedUrl = Uri.encodeComponent(currentUrl);
    log(label, name: 'test');
    switch (label.toLowerCase()) {
      case 'facebook_logo':
        return 'https://www.facebook.com/sharer/sharer.php?u=$encodedUrl';
      case 'linkedin_logo':
        return 'https://www.linkedin.com/sharing/share-offsite/?url=$encodedUrl';
      case 'whatsapp_logo':
        return 'https://wa.me/?text=$encodedUrl';
      case 'X-logo':
        return 'https://x.com/intent/tweet?url=$encodedUrl&text=Check this out!';
      default:
        return encodedUrl; // fallback to just the URL
    }
  }

  Widget _buildShareButton(
      String assetPath, String name, String label, String currentUrl) {
    return IconButton(
      icon: ImageWidget(
        imageUrl: assetPath,
        label: name,
        width: 40,
        height: 40,
      ),
      onPressed: () {
        final shareUrl = getShareUrlByLabel(label, currentUrl);
        _shareUrl(shareUrl);
      },
    );
  }
}
