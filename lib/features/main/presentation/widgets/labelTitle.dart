


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veloshop/core/constants/dimens.dart';
import 'package:veloshop/core/extention/sizboxextension.dart';

class LabelTitle extends StatelessWidget {
  const LabelTitle({super.key, required this.label, required this.onTop});

  final String label;
  final VoidCallback onTop;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(label),

          IconButton(
            onPressed: onTop,
            icon: Row(
              children: [
                Text('مشاهده همه'),
                AppDimers.small.width,
                Icon(CupertinoIcons.arrow_right),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
