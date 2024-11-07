// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:technical_round/Constants/colors.dart';

Widget commonTextField(
    {TextEditingController? controller,
    String? labelText,
    Widget? suffixIcon,
    EdgeInsetsGeometry? contentPadding,
    TextAlign textAlign = TextAlign.start}) {
  return TextFormField(
    controller: controller,
    textAlign: textAlign,
    textDirection: TextDirection.ltr,
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.grey50,
      hintText: labelText, // Add a label for clarity
      contentPadding: contentPadding,

      hintStyle: const TextStyle(color: AppColors.labelColor),
      suffixIcon: suffixIcon,
      border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(30))),
    ),
  );
}
