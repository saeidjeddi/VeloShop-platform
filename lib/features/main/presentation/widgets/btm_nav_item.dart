import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:veloshop/core/theme/colors/dark.dart';








class BtmNavItem extends StatelessWidget {
  const BtmNavItem({
    super.key,
    required this.iconSvgPath,
    required this.isActive,
    required this.onTap,
    required this.text,
  });

  final String iconSvgPath;
  final String text;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SizedBox.expand(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  iconSvgPath,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    isActive
                        ? ColorDorkMode.btmNavActiveItem
                        : ColorDorkMode.btmNavInActiveItem,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}