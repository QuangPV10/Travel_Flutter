import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_ui_200lab/src/constant/color_constant.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/screens/booking_screen.dart';
import 'package:travel_ui_200lab/src/screens/favorite_screen.dart';
import 'package:travel_ui_200lab/src/screens/home_screen.dart';
import 'package:travel_ui_200lab/src/screens/profile_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: const [
        HomeScreen(),
        FavoriteScreen(),
        BookingScreen(),
        ProfileScreen()
      ]),
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
        margin: const EdgeInsets.symmetric(
            horizontal: kMediumPadding, vertical: kDefaultPadding),
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.house,
              size: kDefaultIconSize,
            ),
            title: const Text("Home"),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.solidHeart,
              size: kDefaultIconSize,
            ),
            title: const Text("Likes"),
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.briefcase,
              size: kDefaultIconSize,
            ),
            title: const Text("Booking"),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.solidUser,
              size: kDefaultIconSize,
            ),
            title: const Text("Profile"),
          ),
        ],
      ),
    );
  }
}
