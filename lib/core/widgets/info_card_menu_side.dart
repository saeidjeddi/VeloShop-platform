import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veloshop/core/theme/text_style/dark_text_style.dart';




class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name,
    required this.permissions,
    required this.onClose,
  });

  final String name;
  final String permissions;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [

            SizedBox(
              width: size.width * .4,
              height: 75,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: const Icon(
                    CupertinoIcons.person,
                  ),
                ),
                title: Text(
                  name,
                  style: AppTextstyleDarkMode.titleAppSideMenu,
                ),
                subtitle: Text(
                  permissions,
                  style: AppTextstyleDarkMode.captionSideMenu,
                ),
              ),
            ),

            IconButton(
              onPressed: onClose,
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}