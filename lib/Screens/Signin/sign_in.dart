import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/Common/submit_button.dart';
import 'package:technical_round/Common/text_formField.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/font_weidht.dart';
import 'package:technical_round/Constants/sizes.dart';
import 'package:technical_round/Routes/route_name.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                      horizontal: 32.0,
                      vertical: 42), // Add padding for better UI
                  child: Column(
                    children: [
                      SizedBox(
                          width: double
                              .infinity, // Constrain the width of the TextFormField
                          child: commonTextField(
                              labelText: 'Email',
                              contentPadding: const EdgeInsets.all(18))),
                      h32, // Add space between the fields
                      SizedBox(
                          width: double
                              .infinity, // Constrain the width of the TextFormField
                          child: commonTextField(
                              labelText: 'Email',
                              contentPadding: const EdgeInsets.all(18))),
                      h32, // Add space between the fields
                      SizedBox(
                          width: double
                              .infinity, // Constrain the width of the TextField
                          child: commonTextField(
                              labelText: 'Password',
                              contentPadding: const EdgeInsets.all(18),
                              suffixIcon: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Icon(Icons.visibility_outlined),
                              ))),
                      h54,
                      submitButton(
                        onPressed: () {},
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(
                              color: AppColors.white, fontWeight: bold),
                        ),
                      ),
                      h40,

                      RichText(
                        text: TextSpan(
                          text: "Already have account? ",
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'SIGN IN',
                              style: const TextStyle(
                                color: AppColors.mainColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(RouteName.login);
                                  // Navigate to the Sign Up screen
                                },
                            ),
                          ],
                        ),
                      ),
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
