import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veloshop/core/constants/assets_path/image_path.dart';
import 'package:veloshop/core/theme/text_style/dark_text_style.dart';
import 'package:veloshop/features/main/presentation/pages/side_menu.dart';
import 'package:veloshop/core/widgets/appBarCostum.dart';





class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.onMenuPressed,
  });

  final VoidCallback onMenuPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarCustom(
        size: size,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'فروشگاه Velo',
              style: AppTextstyleDarkMode.titleAppBar,
            ),

            IconButton(
              onPressed: onMenuPressed,
              icon: const Icon(
                CupertinoIcons.list_bullet,
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Image.asset(
            ImagePath.background,
          ),
        ],
      ),
    );
  }
}