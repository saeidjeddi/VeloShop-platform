

import 'package:flutter/material.dart';



class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key, required this.size, required this.child});

  final Size size;
  final Widget child;


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: PreferredSize(preferredSize: Size(size.width, size.height), child: child,));
  }

  @override

  Size get preferredSize => Size.fromHeight(75);
}