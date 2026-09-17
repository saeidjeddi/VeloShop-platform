

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veloshop/core/constants/assets_path/icons_path.dart';
import 'package:veloshop/core/utils/app_snackbar.dart';
import 'package:veloshop/features/cart/presentation/pages/cart_screen.dart';
import 'package:veloshop/features/categories/presentation/pages/categories_screen.dart';
import 'package:veloshop/features/main/presentation/pages/home_screen.dart';
import 'package:veloshop/features/main/presentation/pages/menu_screen.dart';
import 'package:veloshop/features/main/presentation/widgets/btm_nav_item.dart';
import 'package:veloshop/features/profile/presentation/pages/profile_user_screen.dart';

class BtnNavScreenIndex {
  BtnNavScreenIndex._();
  static const home = 0;
  static const category = 1;
  static const cart = 2;
  static const profile = 3;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // ----------------------
  void btnNavOnPressedChengeIndex({required int index}) {
    if (selectedIndex == index) {
      map[index]!.currentState?.popUntil((route) => route.isFirst);
      return;
    }

    setState(() {
      selectedIndex = index;

      if (index == BtnNavScreenIndex.home) {
        _history.remove(index);
        _history.insert(0, index);
      } else {
        _history.remove(index);
        _history.add(index);
      }
    });
  }
  // ------------------


  late final List<int> _history = [
    BtnNavScreenIndex.home
  ];

  DateTime? _lastBackPressed;

  // --------------

  int selectedIndex = BtnNavScreenIndex.home;

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _categoryKey = GlobalKey();
  final GlobalKey<NavigatorState> _cartKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    BtnNavScreenIndex.home: _homeKey,
    BtnNavScreenIndex.category: _categoryKey,
    BtnNavScreenIndex.cart: _cartKey,
    BtnNavScreenIndex.profile: _profileKey,
  };

  void _onWillPop(bool didPop, Object? result) {
    if (didPop) return;

    final navigator = map[selectedIndex]?.currentState;

    if (navigator == null) return;

    if (navigator.canPop()) {
      navigator.pop();
    } else if (_history.length > 1) {
      setState(() {
        _history.removeLast();
        selectedIndex = _history.last;
      });
    } else {
      final now = DateTime.now();

      if (_lastBackPressed == null ||
          now.difference(_lastBackPressed!) > const Duration(seconds: 2) ) {
        _lastBackPressed = now;

        AppNotificationSnackBar.show(
          context,
          message: "برای خروج دوباره دکمه بازگشت را فشار دهید",
          icon: Icons.exit_to_app_outlined,
          backgroundColor: Colors.blue,
          position: NotificationPosition.top,
          duration: const Duration(seconds: 2),

        );
        return;
      }

      SystemNavigator.pop();
    }
  }




  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double btmNavHeight = (size.height * .05).clamp(56.0, 72.0);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onWillPop,
      child: Scaffold(

        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: btmNavHeight,
                child: IndexedStack(
                  index: selectedIndex,
                  children: [
                    Navigator(
                      key: _homeKey,
                      // initialRoute : ScreenNames.homeScreen,
                      onGenerateRoute: (settings) =>
                          MaterialPageRoute(builder: (_) => MenuScreen()),
                    ),
                    Navigator(
                      key: _categoryKey,
                      // initialRoute : ScreenNames.homeScreen,
                      onGenerateRoute: (settings) =>
                          MaterialPageRoute(builder: (_) => CategoriesScreen()),
                    ),
                    Navigator(
                      key: _cartKey,
                      // initialRoute: ScreenNames.scannerScreen,
                      onGenerateRoute: (settings) =>
                          MaterialPageRoute(builder: (_) => CartScreen()),
                    ),
                    Navigator(
                      key: _profileKey,
                      // initialRoute : ScreenNames.searchScreen,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (_) => ProfileUserScreen(),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: btmNavHeight,

                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(width: 1, color: Colors.grey.shade400))
                  ),


                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        BtmNavItem(
                          iconSvgPath: IconsPathSVG.home,
                          isActive: selectedIndex == BtnNavScreenIndex.home,
                          onTap: () {
                            btnNavOnPressedChengeIndex(
                              index: BtnNavScreenIndex.home,
                            );
                          }, text: 'خانه',
                        ),

                        BtmNavItem(
                          iconSvgPath: IconsPathSVG.category,
                          isActive: selectedIndex == BtnNavScreenIndex.category,
                          onTap: () {
                            btnNavOnPressedChengeIndex(
                              index: BtnNavScreenIndex.category,
                            );
                          }, text: 'دسته بندی',
                        ),

                        BtmNavItem(
                          iconSvgPath: IconsPathSVG.cart,
                          isActive: selectedIndex == BtnNavScreenIndex.cart,
                          onTap: () {
                            btnNavOnPressedChengeIndex(
                              index: BtnNavScreenIndex.cart,
                            );
                          }, text: 'سبدخرید',
                        ),

                        BtmNavItem(
                          iconSvgPath: IconsPathSVG.user,
                          isActive: selectedIndex == BtnNavScreenIndex.profile,
                          onTap: () {
                            btnNavOnPressedChengeIndex(
                              index: BtnNavScreenIndex.profile,
                            );
                          }, text: 'پروفایل',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}