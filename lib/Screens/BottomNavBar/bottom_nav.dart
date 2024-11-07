import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/data.dart';
import 'package:technical_round/Screens/Home/home.dart';
import 'package:technical_round/Screens/HomeCategory/category.dart';
import 'package:technical_round/Screens/Notifications/notifications.dart';
import 'package:technical_round/Screens/Profile/profile.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _getSelectedWidget(_selectedIndex),
      ),
      floatingActionButton: Container(
        height: 70,
        width: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color(0xff5151C6),
              Color(0xff888BF4),
            ],
          ),
        ),
        child: Center(
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
            child: const Icon(
              Icons.add,
              color: AppColors.black,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: homeIcon
                .map(
                  (e) => IconButton(
                    icon: homeIcon.indexOf(e) == _selectedIndex
                        ? SvgPicture.asset(
                            e['filledImage'],
                            height: 24,
                            width: 23,
                          )
                        : SvgPicture.asset(
                            height: 24,
                            width: 23,
                            e['image'],
                            // ignore: deprecated_member_use
                            color: AppColors.grey,
                          ),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = homeIcon.indexOf(e);
                        _onItemTapped(_selectedIndex);
                      });
                    },
                  ),
                )
                .toList()),
      ),
    );
  }

  Widget _getSelectedWidget(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const HomeCategory();
      case 2:
        return const NotificationsScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }
}
