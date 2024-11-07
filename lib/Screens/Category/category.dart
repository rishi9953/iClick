import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/Common/gradient_text.dart';
import 'package:technical_round/Common/submit_button.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/data.dart';
import 'package:technical_round/Constants/font_weidht.dart';
import 'package:technical_round/Constants/sizes.dart';
import 'package:technical_round/Routes/route_name.dart';

class CatergoryScreen extends StatefulWidget {
  const CatergoryScreen({super.key});

  @override
  State<CatergoryScreen> createState() => _CatergoryScreenState();
}

class _CatergoryScreenState extends State<CatergoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/header.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'iClick',
                    style: TextStyle(
                        color: AppColors.white, fontWeight: bold, fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
          h40,
          const Text(
            'Who are you?',
            style: TextStyle(fontWeight: bold, fontSize: 24),
          ),
          h16,
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: .78),
                      itemBuilder: (context, index) {
                        var data = categories[index];
                        return Container(
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(data['image']),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              data['title'],
                              style: const TextStyle(
                                  color: AppColors.white, fontWeight: bold),
                            ),
                          ),
                        );
                      }),
                  h40,
                  gradientText(
                    'SHARE - INSPIRE - CONNECT',
                  ),
                  h40,
                  submitButton(
                      onPressed: () {
                        Get.toNamed(RouteName.bottomNav);
                      },
                      child: const Text(
                        'EXPLORE NOW',
                        style:
                            TextStyle(color: AppColors.white, fontWeight: bold),
                      ))
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
