import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/data.dart';
import 'package:technical_round/Constants/font_weidht.dart';
import 'package:technical_round/Constants/sizes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Expanded(
                  child: SizedBox(
                height: 45, // Increase height for better appearance
                child: TextFormField(
                  onTap: () {},
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10), // Adjust padding for better alignment
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: AppColors.labelColor),
                    prefixIcon: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => const RadialGradient(
                        center: Alignment.topCenter,
                        colors: [
                          Color(0xff5151C6),
                          Color(0xff888BF4),
                        ],
                      ).createShader(bounds),
                      child: const Icon(
                        Icons.search,
                        size: 20,
                      ),
                    ),
                    filled: true,
                    // fillColor:
                    //     AppColors.fillColor, // Add background color if needed
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              )),
              const SizedBox(
                  width: 10), // Add spacing between text field and the icon
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'))
            ],
          ),
          actions: const [
            w10, // You can remove this or adjust based on your layout needs
          ],
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(categories[index]['image'])),
                ),
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: index % 2 == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Text(
                        categories[index]['title'].toString().toUpperCase(),
                        style: const TextStyle(
                            color: AppColors.white,
                            fontWeight: bold,
                            fontSize: 20),
                      )),
                ),
              );
            }));
  }
}
