import 'package:flutter/material.dart';


extension SizBoxExtension on double {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());
}