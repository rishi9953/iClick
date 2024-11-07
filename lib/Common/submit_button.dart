import 'package:flutter/material.dart';

Widget submitButton({
  required void Function()? onPressed,
  required Widget? child,
}) {
  return Container(
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color(0xff5151C6), // Ending color
          Color(0xff888BF4), // Starting color
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 52),
        elevation: 0,
        backgroundColor:
            Colors.transparent, // Ensure the button's background is transparent
        shadowColor: Colors.transparent, // Remove any shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: child,
    ),
  );
}
