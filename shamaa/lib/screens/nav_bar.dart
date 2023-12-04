import 'package:flutter/material.dart';

import 'package:shamaa/screens/home_screen.dart';
import 'package:shamaa/screens/leaderboards_screen.dart';
import 'package:shamaa/screens/profile_screen.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:shamaa/style/custom_colors.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return FloatingNavBar(
      borderRadius: 65.5,
      resizeToAvoidBottomInset: false,
      color: purple,
      selectedIconColor: white,
      unselectedIconColor: white,
      items: [
        FloatingNavBarItem(
            iconData: Icons.home_outlined, page: HomeScreen(), title: ''),
        FloatingNavBarItem(
            iconData: Icons.local_activity_rounded,
            page: LeaderboardsScreen(),
            title: ''),
        FloatingNavBarItem(
            iconData: Icons.person_outline_outlined,
            page: ProfileScreen(),
            title: ''),
      ],
      horizontalPadding: 15.0,
      hapticFeedback: true,
      showTitle: false,
    );
  }
}
