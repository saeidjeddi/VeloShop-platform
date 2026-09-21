import 'package:flutter/material.dart';
import 'package:veloshop/core/utils/productVideoPlayer.dart';
import 'package:veloshop/features/cart/presentation/pages/cart_screen.dart';
import 'package:veloshop/features/categories/presentation/pages/categories_screen.dart';
import 'package:veloshop/features/main/presentation/pages/main_screen.dart';
import 'package:veloshop/features/main/presentation/route/names.dart';
import 'package:veloshop/features/products/presentation/pages/product_screen.dart';
import 'package:veloshop/features/profile/presentation/pages/profile_user_screen.dart';
import 'package:video_player/video_player.dart';




Map<String, Widget Function(BuildContext)> routes = {
  ScreenNames.root: (context) => MainScreen(),

  ScreenNames.cartScreen: (context) => CartScreen(),

  ScreenNames.profileUserScreen: (context) => ProfileUserScreen(),

  ScreenNames.categoriesScreen: (context) => CategoriesScreen(),

  ScreenNames.productScreen: (context) => ProductScreen(),

  ScreenNames.fullscreenVideoPlayer: (context) {
    final controller =
        ModalRoute.of(context)!.settings.arguments as VideoPlayerController;

    return FullscreenVideoPlayer(
      controller: controller,
    );
  },
};