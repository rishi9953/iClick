import 'package:flutter/material.dart';
import 'package:technical_round/Common/svg_imge.dart';
import 'package:technical_round/Constants/sizes.dart';
import 'package:technical_round/Screens/Collections/collection_bottomsheet.dart';
import 'package:technical_round/Screens/Home/Comments/comments.dart';

class PopularPost extends StatelessWidget {
  const PopularPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return buildCard(context);
            }));
  }

  Widget buildCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        child: Column(
          children: [
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaHVxtFr0EsmismCmwOrN_4fkCC0VoIUJ6ho3dxn3BEHyfM-HnK0EsDM0b202lY76fvnU&usqp=CAU'),
              ),
              title: Text('Rishabh Kumar'),
              trailing: Text('1 hour ago'),
            ),
            Image.network(
                'https://images.unsplash.com/photo-1728135020024-b617b9f96394?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            ListTile(
              leading: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        showDragHandle: true,
                        enableDrag: true,
                        context: context,
                        builder: (context) {
                          return const CollectionBottomsheet();
                        });
                  },
                  child: const Icon(Icons.add_circle_outline)),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text(
                    '20',
                    style: TextStyle(fontSize: 18),
                  ),
                  w6,
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            showDragHandle: true,
                            context: context,
                            builder: (context) {
                              return const CommentsSheet();
                            });
                      },
                      child: svgAsset('assets/icons/Chat.svg',
                          height: 20, width: 20)),
                  w16,
                  const Text(
                    '125',
                    style: TextStyle(fontSize: 18),
                  ),
                  w6,
                  svgAsset('assets/icons/Heart.svg', height: 20, width: 20)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
