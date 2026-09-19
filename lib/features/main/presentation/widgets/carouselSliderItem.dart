import 'package:flutter/material.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({
    super.key,
    required this.title,
    required this.imgPath,
    required this.left,
    required this.right,
  });

  final String title;
  final String imgPath;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),      child: Stack(
        children: [
          Positioned.fill(
            top: 100,
            right: 30,
            left: 30,
            bottom: 24,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 20, color: Color(0xaa0D253C)),
                ],
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.blue,
              ),

              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [Colors.transparent, Color(0xaa0D253C)],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(32),
                child: Image.asset(imgPath, fit: BoxFit.cover),
              ),
            ),
          ),

          Positioned(
            bottom: size.height * .06,
            left: size.width * .06,
            right: size.width * .07,
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelLarge!
                  .apply(color: Colors.white, fontSizeDelta: 12),
            ),
          ),
        ],
      ),
    );
  }
}
