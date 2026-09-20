import 'package:flutter/material.dart';
import 'package:veloshop/core/constants/assets_path/icons_path.dart';
import 'package:veloshop/core/theme/text_style/dark_text_style.dart';
import 'package:veloshop/core/widgets/side_menu_title.dart';




class SideMenu extends StatefulWidget {
  const SideMenu({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String activePage = 'home';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              // InfoCard(name: 'سعید', permissions: 'کاربر عادی', onClose: widget.onClose,),
              IconButton(
                onPressed:widget.onClose,
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 24, 16),
                child: Text('حافظه', style: AppTextstyleDarkMode.titleAppBar),
              ),

              SideMenuTitle(title: 'ذخیره شده', iconName: IconsPathSVG.bookmark, onTap: () {
                setState(() {
                  activePage = 'bookmark';
                });
              }, isActive: activePage == 'bookmark',),
            ],
          ),
        ),
      ),
    );
  }
}
