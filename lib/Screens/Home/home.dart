import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/Common/gradient_text.dart';
import 'package:technical_round/Common/svg_imge.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/sizes.dart';
import 'package:technical_round/Routes/route_name.dart';
import 'package:technical_round/Screens/Home/popular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // To trigger rebuild when tab changes
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                    color: Colors
                        .white, // Add background color to match the design
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
                  child:
                      svgAsset('assets/icons/Send.svg', height: 24, width: 24),
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
            h10,
            TabBar(
              controller: _tabController, // Attach the controller here
              dividerHeight: 0,
              indicator: BoxDecoration(
                border: Border.all(color: Colors.transparent),
              ),
              tabs: [
                Tab(
                  child: Container(
                    height: 40,
                    width: 118,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _tabController.index == 0
                          ? AppColors.lightMain
                          : Colors
                              .transparent, // Background for non-selected tabs
                    ),
                    child: _tabController.index == 0
                        ? gradientText('Popular')
                        : const Text('Popular'),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 40,
                    width: 118,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _tabController.index == 1
                          ? AppColors.lightMain
                          : Colors
                              .transparent, // Background for non-selected tabs
                    ),
                    child: _tabController.index == 1
                        ? gradientText('Trending')
                        : const Text('Trending'),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 40,
                    width: 118,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _tabController.index == 2
                          ? AppColors.lightMain
                          : Colors
                              .transparent, // Background for non-selected tabs
                    ),
                    child: _tabController.index == 2
                        ? gradientText('Following')
                        : const Text('Following'),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller:
                    _tabController, // Attach the controller here as well
                children: const [
                  PopularPost(),
                  SizedBox(),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
