import 'package:flutter/material.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/font_weidht.dart';
import 'package:technical_round/Constants/sizes.dart';
import 'package:technical_round/Screens/Collections/addto_collection.dart';

class CollectionBottomsheet extends StatefulWidget {
  const CollectionBottomsheet({super.key});

  @override
  State<CollectionBottomsheet> createState() => _CollectionBottomsheetState();
}

class _CollectionBottomsheetState extends State<CollectionBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Save to Collection',
                style: TextStyle(fontWeight: bold),
              ),
              Container(
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
                    onPressed: () {
                      showModalBottomSheet(
                          showDragHandle: true,
                          enableDrag: true,
                          context: context,
                          builder: (context) {
                            return const AddtoCollection();
                          });
                    },
                    child: const Text(
                      'New Collection',
                      style: TextStyle(color: AppColors.white),
                    )),
              ),
            ],
          ),
        ),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          h10,
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text('Your Collections'),
          ),
          Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .95, crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(1),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://plus.unsplash.com/premium_photo-1696972235468-3bfa7fa8bd9e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDV8fHBob3Rvc3xlbnwwfHwwfHx8MA%3D%3D')),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Portrait Photographer',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: bold,
                                    fontSize: 18),
                              ),
                            )),
                          ),
                        ),
                      ],
                    );
                  }))
        ])),
      ]),
    );
  }
}
