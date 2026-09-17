import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:veloshop/core/theme/text_style/dark_text_style.dart';



class SideMenuTitle extends StatelessWidget {
  const SideMenuTitle({
    super.key,
    required this.title,
    required this.iconName,
    required this.onTap,
    required this.isActive,
  });

  final String title;
  final String iconName;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: size.width * .07),
          child: Divider(
            color: Colors.grey.shade700,
          ),
        ),

        Material(
          color: Colors.transparent,
          child: SizedBox(
            height: 56,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  right: isActive ? (size.width * .02) : -(size.width * .6),
                  top: 0,
                  width: size.width * .5,
                  height: 56,

                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF6792FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                ListTile(
                  onTap: onTap,
                  leading: SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      iconName,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  title: Text(
                    title,
                    style: AppTextstyleDarkMode.libelSideMenu,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}