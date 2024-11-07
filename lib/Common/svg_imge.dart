import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget svgAsset(String path, {double? height, double? width, Color? color}) {
  return SvgPicture.asset(
    path,
    height: height,
    width: width,
    // ignore: deprecated_member_use
    color: color,
  );
}

Widget svgNetwork(String path, {double? height, double? width}) {
  return SvgPicture.network(
    path,
    height: height,
    width: width,
  );
}
