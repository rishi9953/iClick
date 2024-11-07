import 'package:flutter/material.dart';
import 'package:technical_round/Common/submit_button.dart';
import 'package:technical_round/Common/text_formField.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/font_weidht.dart';
import 'package:technical_round/Constants/gradient_text.dart';
import 'package:technical_round/Constants/sizes.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                        'SET NEW PASSWORD',
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
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: AppColors.lightMain,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Type your new password',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      h40,
                      commonTextField(
                          labelText: 'Password',
                          suffixIcon: const Icon(Icons.visibility_outlined)),
                      h40,
                      commonTextField(
                          labelText: 'Confirm Password',
                          suffixIcon: const Icon(Icons.visibility_outlined)),
                      h40,
                      const Text(""),
                      h40,
                      submitButton(
                          onPressed: () {},
                          child: const Text(
                            'SEND',
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
