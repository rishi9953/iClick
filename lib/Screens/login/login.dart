import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:technical_round/Common/submit_button.dart';
import 'package:technical_round/Common/text_formField.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/font_weidht.dart';
import 'package:technical_round/Constants/sizes.dart';
import 'package:technical_round/Routes/route_name.dart';
import 'package:technical_round/Screens/login/login_cubit.dart';
import 'package:technical_round/Screens/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCubit cubit = LoginCubit();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
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
                      width: size.width,
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
                            SizedBox(
                                width: double.infinity,
                                child: commonTextField(
                                    controller: cubit.emailController,
                                    labelText: 'Email',
                                    contentPadding: const EdgeInsets.all(18))),
                            h32,
                            SizedBox(
                                width: double.infinity,
                                child: commonTextField(
                                    controller: cubit.passwordController,
                                    labelText: 'Password',
                                    contentPadding: const EdgeInsets.all(18),
                                    suffixIcon: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: Icon(Icons.visibility_outlined),
                                    ))),
                            h40,
                            TextButton(
                                onPressed: () {
                                  Get.toNamed(RouteName.forgetpassword);
                                },
                                child: const Text(
                                  'FORGOT PASSWORD',
                                  style: TextStyle(color: AppColors.mainColor),
                                )),
                            h54,
                            submitButton(
                              onPressed: () {
                                if (cubit.emailController.text.isNotEmpty &&
                                    cubit.passwordController.text.isNotEmpty) {
                                  cubit.login(cubit.emailController.text,
                                      cubit.passwordController.text);
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Please fill all fields',
                                      toastLength: Toast.LENGTH_SHORT,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: AppColors.mainColor,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              },
                              child: const Text(
                                'LOG IN',
                                style: TextStyle(
                                    color: AppColors.white, fontWeight: bold),
                              ),
                            ),
                            h40,
                            const Text('OR LOG IN BY'),
                            h14,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: AppColors.lightMain,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ShaderMask(
                                    shaderCallback: (bounds) =>
                                        const RadialGradient(
                                      center: Alignment.center,
                                      radius: 0.5,
                                      colors: [
                                        Color(0xff5151C6),
                                        Color(0xff888BF4),
                                      ],
                                      tileMode: TileMode.mirror,
                                    ).createShader(bounds),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        'assets/svg/google.svg',
                                        // ignore: deprecated_member_use
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                w20,
                                Container(
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: AppColors.lightMain,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ShaderMask(
                                    shaderCallback: (bounds) =>
                                        const RadialGradient(
                                      center: Alignment.center,
                                      radius: 0.5,
                                      colors: [
                                        Color(0xff5151C6),
                                        Color(0xff888BF4),
                                      ],
                                      tileMode: TileMode.mirror,
                                    ).createShader(bounds),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SvgPicture.asset(
                                        'assets/svg/facebook.svg',
                                        // ignore: deprecated_member_use
                                        color: Colors.white,
                                        height: 30,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            h40,
                            RichText(
                              text: TextSpan(
                                text: "Don't have an account? ",
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'SIGN UP',
                                    style: const TextStyle(
                                      color: AppColors.mainColor,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed(RouteName.signin);
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
        },
      ),
    );
  }
}
