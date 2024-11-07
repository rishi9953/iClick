import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:technical_round/Constants/sizes.dart';
import 'package:technical_round/controller.dart';
import 'package:technical_round/user_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IncrementContrller contrller = IncrementContrller();

  @override
  void initState() {
    contrller.fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.purpleAccent,
          body: GetBuilder(
            init: contrller,
            builder: (context1) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  profileCard(context),
                  h10,
                  Expanded(
                      child: Column(
                    children: [
                      TabBar(
                          indicatorWeight: 0,
                          indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(width: 0)),
                          tabs: [
                            Tab(
                              child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                      color: Colors.amber),
                                  child:
                                      const Center(child: Text("Leaderboard"))),
                            ),
                            Tab(
                              child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      color: Colors.amber),
                                  child:
                                      const Center(child: Text("Yourscore"))),
                            ),
                          ]),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: context1.userList == null
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : TabBarView(children: [
                                leaderBoard(context1.userList!.data),
                                const SizedBox()
                              ]),
                      )
                    ],
                  ))
                ],
              ),
            ),
          )),
    );
  }

  Widget profileCard(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: SvgPicture.asset(
                'assets/back.svg',
                height: 25,
                // ignore: deprecated_member_use
                color: Colors.purple,
              ),
              title: const Center(
                child: Text(
                  'LeaderBoard',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.purple),
                ),
              ),
            ),
            const CircleAvatar(
              radius: 40,
              child: Text('R'),
            ),
            const SizedBox(height: 20),
            const Text('Rishabh'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                scoreCard('Your Score', '0', width: size.width * 0.3),
                scoreCard('Global Rank', '0', width: size.width * 0.3),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget scoreCard(String title, String score, {double? width}) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.purple, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              score,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget leaderBoard(List<UserData> userdata) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 149, 68, 255),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: userdata.isEmpty
          ? const Center(
              child: Text('No Users Found...'),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: userdata.length,
              itemBuilder: (context, index) {
                var user = userdata[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                );
              }),
    );
  }
}
