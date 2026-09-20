import 'package:flutter/material.dart';
import 'package:veloshop/core/constants/dimens.dart';

class ElevatedButtonStyleDarkMod {
  ElevatedButtonStyleDarkMod._();

  static final ButtonStyle mainElevatedButton =
  ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(50),
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    elevation: 5,
    shadowColor: Colors.blue.shade600,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        AppDimers.medium,
      ),
    ),
  );
}