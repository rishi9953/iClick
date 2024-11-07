import 'package:flutter/material.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/sizes.dart';

class CommentsSheet extends StatelessWidget {
  const CommentsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text('Comments'),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return commentCard();
              }),
        ),
        TextFormField(
          decoration: InputDecoration(
              hintText: 'Type Something...',
              contentPadding: const EdgeInsets.all(16.0),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff5151C6), // Ending color
                        Color(0xff888BF4), // Starting color
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors
                            .transparent, // Ensure the button's background is transparent
                        shadowColor: Colors.transparent, // Remove any shadow
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Post',
                        style: TextStyle(color: AppColors.white),
                      )),
                ),
              )),
        )
      ],
    );
  }

  Widget commentCard() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(8.9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.lightMain),
      child: const Column(
        children: [
          ListTile(
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaHVxtFr0EsmismCmwOrN_4fkCC0VoIUJ6ho3dxn3BEHyfM-HnK0EsDM0b202lY76fvnU&usqp=CAU'),
                ),
                w10,
                Text("Rishabh")
              ],
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(left: 48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Great Shot I love it'),
                  h20,
                  Row(
                    children: [
                      Text('2 mins ago'),
                      w10,
                      Text('Like'),
                      Spacer(),
                      Text('02'),
                      w4,
                      Icon(Icons.favorite_outline)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
