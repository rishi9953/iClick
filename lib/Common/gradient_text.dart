import 'package:flutter/material.dart';
import 'package:technical_round/Constants/gradient_text.dart';

Widget gradientText(String text) {
  return GradientText(
    text,
    gradient: const LinearGradient(
      colors: [
        Color(0xff5151C6),
        Color(0xff888BF4),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}
