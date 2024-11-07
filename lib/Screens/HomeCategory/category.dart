import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/Common/gradient_text.dart';
import 'package:technical_round/Common/svg_imge.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/data.dart';
import 'package:technical_round/Routes/route_name.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
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
                  onTap: () {
                    Get.toNamed(RouteName.search);
                  },
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
              ),
            ),
            const SizedBox(
                width: 10), // Adjust spacing between text field and the icon
            InkWell(
              onTap: () {
                Get.toNamed(RouteName.chatscreen);
              },
              child: Container(
                width: 45, // Increased size for a better tap area
                height: 45, // Match height for consistency
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      Colors.white, // Add background color to match the design
                  boxShadow: [
                    // Add shadow for better visual effect
                    // BoxShadow(
                    //   color: Colors.black12,
                    //   blurRadius: 4,
                    //   offset: Offset(0, 2),
                    // ),
                  ],
                ),
                padding: const EdgeInsets.all(8.0),
                child: svgAsset('assets/icons/Send.svg', height: 24, width: 24),
              ),
            ),
          ],
        ),
        actions: const [
          SizedBox(width: 10), // Adjust or remove spacing as needed
        ],
      ),
      body: Column(
        children: [
          buildSection(title: 'Topic', subtitle: topic),
          buildSection(title: 'Collection', subtitle: topic),
          buildSection(title: 'Collection', subtitle: topic),
        ],
      ),
    );
  }

  Widget buildSection({required String title, required List subtitle}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              gradientText('View more'),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: subtitle.length,
            itemBuilder: (itemBuilderContext, index) {
              return Container(
                width: 170,
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1677870728110-3b3b41677a9b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDd8fGdhbWluZ3xlbnwwfHwwfHx8MA%3D%3D'),
                    )),
                alignment: Alignment.center,
                child: Text(
                  subtitle[index],
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
