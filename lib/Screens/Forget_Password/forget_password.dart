import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/Common/submit_button.dart';
import 'package:technical_round/Common/text_formField.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/font_weidht.dart';
import 'package:technical_round/Constants/gradient_text.dart';
import 'package:technical_round/Constants/sizes.dart';
import 'package:technical_round/Routes/route_name.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                        'TYPE YOUR EMAIL',
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
                          'We will send you instruction on how to reset your password',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      h40,
                      commonTextField(labelText: 'Password'),
                      h40,
                      const Text(""),
                      h40,
                      submitButton(
                          onPressed: () {
                            Get.toNamed(RouteName.resetPassword);
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
