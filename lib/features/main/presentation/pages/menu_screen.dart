import 'dart:math';

import 'package:flutter/material.dart';
import 'package:veloshop/features/main/presentation/pages/side_menu.dart';
import 'package:veloshop/features/main/presentation/pages/home_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  static const double menuWidth = 288;
  static const double visibleHomeWidth = 70;

  bool isMenuOpen = false;

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  void closeMenu() {
    if (!isMenuOpen) return;

    setState(() {
      isMenuOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Side Menu
          Positioned.fill(child: SideMenu(onClose: closeMenu)),

          // Home
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: isMenuOpen ? menuWidth - visibleHomeWidth : 0,
            child: Transform(
              alignment: Alignment.centerLeft,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(isMenuOpen ? -20 * pi / 180 : 0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(isMenuOpen ? 28 : 0),
                  bottomRight: Radius.circular(isMenuOpen ? 28 : 0),
                ),
                child: HomeScreen(onMenuPressed: toggleMenu),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
