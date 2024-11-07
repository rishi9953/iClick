import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/font_weidht.dart';
import 'package:technical_round/Constants/sizes.dart';
import 'package:technical_round/Routes/route_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'i.click',
                  style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: AppColors.white),
                ),
                h20,
                Image.asset('assets/photos.png'),
                h20,
                const Text(
                  'SHARE - INSPIRE - CONNECT',
                  style: TextStyle(color: AppColors.white),
                ),
                h20,
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.grey.withOpacity(0.4)),
                    onPressed: () {
                      Get.toNamed(RouteName.login);
                    },
                    child: const Text(
                      'GET STARTED',
                      style:
                          TextStyle(color: AppColors.white, fontWeight: bold),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
