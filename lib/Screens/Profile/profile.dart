import 'package:flutter/material.dart';
import 'package:technical_round/Common/gradient_text.dart';
import 'package:technical_round/Common/svg_imge.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/font_weidht.dart';
import 'package:technical_round/Constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/header.png',
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 150,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaHVxtFr0EsmismCmwOrN_4fkCC0VoIUJ6ho3dxn3BEHyfM-HnK0EsDM0b202lY76fvnU&usqp=CAU'),
              ),
            ),
            const Positioned(
              left: 120,
              top: 100,
              child: Text(
                '@brunopham',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Positioned(
              right: 20,
              top: 100,
              child: Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 280,
              child: Column(
                children: [
                  const Text(
                    'Rishabh Kumar',
                  ),
                  h12,
                  const Text(
                    'Da Nang Viet Nam',
                  ),
                  h20,
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey200,
                    ),
                    width: 400,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Wrap(
                            children: [
                              Text(
                                '220',
                                style: TextStyle(fontWeight: bold),
                              ),
                              w4,
                              Text('Followers')
                            ],
                          ),
                          Wrap(
                            children: [
                              Text(
                                '150',
                                style: TextStyle(fontWeight: bold),
                              ),
                              w4,
                              Text('Following')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  h20,
                  Row(
                    children: [
                      svgAsset('assets/icons/globe.svg'),
                      w20,
                      dotWidger(),
                      w20,
                      svgAsset('assets/icons/instagram.svg'),
                      w20,
                      dotWidger(),
                      w20,
                      svgAsset('assets/icons/facebook.svg'),
                      w20,
                    ],
                  ),
                  h20,
                  DefaultTabController(
                    length: 2,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          TabBar(
                              dividerHeight: 0,
                              indicator: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                              ),
                              tabs: [
                                Tab(
                                    child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors
                                        .lightMain, // Background for non-selected tabs
                                  ),
                                  height: 50,
                                  width: double.infinity,
                                  child: Center(child: gradientText('0 Shots')),
                                )),
                                Tab(
                                    child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors
                                        .lightMain, // Background for non-selected tabs
                                  ),
                                  height: 50,
                                  width: double.infinity,
                                  child: Center(
                                      child: gradientText('0 Collections')),
                                )),
                              ]),
                          Expanded(
                            child: TabBarView(
                              children: [
                                // For "Shots" tab
                                SingleChildScrollView(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 64.0),
                                        child: svgAsset(
                                          'assets/icons/nodata.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // For "Collections" tab (fix scrolling issue)
                                GridView.builder(
                                  padding: const EdgeInsets.all(8.0),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.95,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: 8 + 4,
                                  itemBuilder: (context, index) {
                                    return gridShots(index + 1);
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dotWidger() {
    return Container(
      height: 6,
      width: 6,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff5151C6), // Ending color
            Color(0xff888BF4)
          ]),
          shape: BoxShape.circle),
    );
  }

  Widget gridShots(int index) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(
                  'https://media.istockphoto.com/id/867757922/photo/collage-of-india-images-travel-background.jpg?s=2048x2048&w=is&k=20&c=_02Rvs-Z0hl8alhhK3rcuhwdes0reWTdYZs-C6j57Gc=')),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.black.withOpacity(0.5),
        ),
        child: Center(
          child: Text(
            '$index Your Likes',
            style: const TextStyle(
                color: AppColors.white, fontWeight: bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
