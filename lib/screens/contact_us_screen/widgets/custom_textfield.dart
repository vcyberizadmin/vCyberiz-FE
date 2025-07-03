// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final double? height;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final Widget? suffix;
  final int? maxLines;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.height,
    required this.controller,
    required this.keyBoardType,
    required this.validator,
    this.hintText,
    this.suffix,
    this.maxLines,
    this.onTap,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            kStyle.med(
              text: labelText,
            ),
            if (validator != null) kStyle.reg(text: ' *', color: AppColors.red),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          onTap: onTap,
          focusNode: focusNode,
          controller: controller,
          keyboardType: keyBoardType,
          validator: validator,
          style: TextStyle(
            fontFamily: Constants.font,
            fontSize: 14,
            color: AppColors.fontBlack,
          ),
          cursorColor: AppColors.fontBlack,
          cursorWidth: 1.5,
          cursorHeight: 16,
          maxLines: maxLines,
          decoration: InputDecoration(
            hoverColor: AppColors.transparent,
            filled: true,
            fillColor: AppColors.white,
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: Constants.font,
              fontSize: 14,
              color: AppColors.fontLightGrey,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 12,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.bluishGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.fontLightGrey),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.red),
            ),
            errorStyle: TextStyle(
              fontSize: 12,
              height: 0.9,
              color: AppColors.red,
              fontFamily: Constants.font,
            ),
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
