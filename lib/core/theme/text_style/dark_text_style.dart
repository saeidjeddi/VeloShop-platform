import 'package:flutter/material.dart';
import 'package:veloshop/core/constants/assets_path/fonts_path.dart';
import 'package:veloshop/core/theme/colors/dark.dart';

class AppTextstyleDarkMode {
  AppTextstyleDarkMode._();


  static final TextStyle title = TextStyle(
    fontFamily: FontsPath.estedad,
    fontSize: 16,
    color: ColorDorkMode.title,
  );

  static TextStyle caption = TextStyle(
    fontFamily: FontsPath.dana,
    fontSize: 12,
    color: ColorDorkMode.title.withAlpha(150),
    fontWeight: FontWeight.normal,
  );

  static TextStyle discount = TextStyle(
    fontFamily: FontsPath.tanha,
    fontSize: 10,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );


  static TextStyle price = TextStyle(
    fontFamily: FontsPath.dana,
    fontSize: 13,
    color: ColorDorkMode.title.withAlpha(150),
    fontWeight: FontWeight.bold,
  );

  static TextStyle priceDiscount = TextStyle(
    fontFamily: FontsPath.vazir,
    fontSize: 10,
    color: ColorDorkMode.title.withAlpha(150),
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.lineThrough
  );


  static TextStyle titleAppBar = TextStyle(
    fontFamily: FontsPath.estedad,
    fontSize: 13,
    color: ColorDorkMode.title,
    fontWeight: FontWeight.normal,
  );

  static TextStyle titleAppSideMenu = TextStyle(
    fontFamily: FontsPath.estedad,
    fontSize: 16,
    color: ColorDorkMode.title,
    fontWeight: FontWeight.normal,
  );
  static TextStyle libelSideMenu = TextStyle(
    fontFamily: FontsPath.estedad,
    fontSize: 14,
    color: ColorDorkMode.title,
    fontWeight: FontWeight.normal,
  );


  static TextStyle captionSideMenu = TextStyle(
    fontFamily: FontsPath.tanha,
    fontSize: 13,
    color: ColorDorkMode.title.withAlpha(150),
    fontWeight: FontWeight.normal,
  );


  static TextStyle captionWarehousWaiting = TextStyle(
    fontFamily: FontsPath.tanha,
    fontSize: 13,
    color: ColorDorkMode.captionWarehousWaiting,
    fontWeight: FontWeight.normal,
  );

  static TextStyle captionWarehousCompletion = TextStyle(
    fontFamily: FontsPath.tanha,
    fontSize: 13,
    color: ColorDorkMode.captionWarehousCompletion,
    fontWeight: FontWeight.normal,
  );

  static TextStyle successesWarehouse = TextStyle(
    fontFamily: FontsPath.vazir,
    fontSize: 12,
    color: ColorDorkMode.successesWarehouse.withAlpha(255),
    fontWeight: FontWeight.normal,
  );




  static const TextStyle btmNavActive = TextStyle(
      fontFamily: 'Dana',
      fontSize: 12,
      color: ColorDorkMode.btmNavActiveItem);

  static const TextStyle btmNavInActive = TextStyle(
      fontFamily: 'Dana',
      fontSize: 12,
      color: ColorDorkMode.btmNavInActiveItem);
}