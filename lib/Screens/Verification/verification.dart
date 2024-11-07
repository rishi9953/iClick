import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/Common/submit_button.dart';
import 'package:technical_round/Common/text_formField.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/font_weidht.dart';
import 'package:technical_round/Constants/gradient_text.dart';
import 'package:technical_round/Constants/sizes.dart';
import 'package:technical_round/Routes/route_name.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Positioned.directional(
              textDirection: TextDirection.ltr,
              child: Image.asset(
                'assets/svg/welcome.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Positioned(
              top: 300,
              child: Container(
                width: size.width, // Ensures the container takes full width
                height: size.height,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 42),
                  child: Column(
                    children: [
                      const GradientText(
                        'VERIFICATION',
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff5151C6),
                            Color(0xff888BF4),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      h14,
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: AppColors.lightMain,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'A message with verification code was sent to your mobile phone.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      h40,
                      commonTextField(
                          labelText: 'Type verification code',
                          textAlign: TextAlign.center),
                      h40,
                      const Text("DON'T RECEIVE THE CODE"),
                      h40,
                      submitButton(
                          onPressed: () {
                            Get.toNamed(RouteName.category);
                          },
                          child: const Text(
                            'VERIFY',
                            style: TextStyle(
                                color: AppColors.white, fontWeight: bold),
                          )),
                      h40,
                      Image.asset('assets/square.png')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
