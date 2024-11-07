import 'package:flutter/material.dart';
import 'package:technical_round/Common/gradient_text.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/font_weidht.dart';
import 'package:technical_round/Constants/sizes.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Activity',
            style: TextStyle(fontWeight: bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      showDragHandle: true,
                      enableDrag: true,
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            const Center(
                              child: Text(
                                'Activity Feed',
                                style: TextStyle(fontWeight: bold),
                              ),
                            ),
                            h16,
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    tileColor: AppColors.grey200,
                                    title: const Text('Collections'),
                                    trailing: Switch(
                                        activeColor: AppColors.mainColor,
                                        value: true,
                                        onChanged: (vlaue) {}),
                                  ),
                                  h10,
                                  ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    tileColor: AppColors.grey200,
                                    title: const Text('Comment Likes'),
                                    trailing: Switch(
                                        activeColor: AppColors.mainColor,
                                        value: true,
                                        onChanged: (vlaue) {}),
                                  ),
                                  h10,
                                  ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    tileColor: AppColors.grey200,
                                    title: const Text('Followers'),
                                    trailing: Switch(
                                        activeColor: AppColors.mainColor,
                                        value: true,
                                        onChanged: (vlaue) {}),
                                  ),
                                  h10,
                                  ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    tileColor: AppColors.grey200,
                                    title: const Text('Likes'),
                                    trailing: Switch(
                                        activeColor: AppColors.mainColor,
                                        value: true,
                                        onChanged: (vlaue) {}),
                                  ),
                                  h10,
                                  ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    tileColor: AppColors.grey200,
                                    title: const Text('Donate'),
                                    trailing: Switch(
                                        activeColor: AppColors.mainColor,
                                        value: true,
                                        onChanged: (vlaue) {}),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.settings_outlined))
          ],
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return notificationCard();
            }));
  }

  Widget notificationCard() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.lightMain),
      child: Column(
        children: [
          ListTile(
            title: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaHVxtFr0EsmismCmwOrN_4fkCC0VoIUJ6ho3dxn3BEHyfM-HnK0EsDM0b202lY76fvnU&usqp=CAU'),
                ),
                w10,
                const Text("Rishabh"),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(top: 12.0),
                  height: 40,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff5151C6),
                        Color(0xff888BF4),
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 10),
                      ),
                      onPressed: () {},
                      child: gradientText('Follow')),
                )
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                        text: 'Liked',
                        style:
                            TextStyle(fontWeight: bold, color: AppColors.black),
                        children: [
                          TextSpan(
                              text: ' "Autumn in my heart"',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff5151C6),
                              ))
                        ]),
                  ),
                  h10,
                  const Text('2 mins ago')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
