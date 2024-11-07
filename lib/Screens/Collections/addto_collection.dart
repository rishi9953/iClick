import 'package:flutter/material.dart';
import 'package:technical_round/Common/submit_button.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/font_weidht.dart';
import 'package:technical_round/Constants/sizes.dart';

class AddtoCollection extends StatelessWidget {
  const AddtoCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            h16,
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.grey200,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                hintText: 'Collection Name',
                hintStyle: const TextStyle(color: AppColors.labelColor),
              ),
            ),
            h16,
            submitButton(
                onPressed: () {},
                child: const Text(
                  'Create Collection',
                  style: TextStyle(color: AppColors.white, fontWeight: bold),
                )),
          ],
        ),
      ),
    );
  }
}
