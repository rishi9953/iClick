import 'package:flutter/material.dart';

Widget netWorkImage(String path, {double? height, double? width}) {
  return Image.network(
    path,
    height: height,
    width: width,
  );
}
