import 'package:flutter/material.dart';
import 'package:veloshop/core/constants/assets_path/image_path.dart';
import 'package:veloshop/core/theme/text_style/dark_text_style.dart';
import 'package:veloshop/core/widgets/appBarCostum.dart';
import 'package:veloshop/core/widgets/productItem.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarCustom(
        size: size,
        child: Row(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            Text('دسته بندی', style: AppTextstyleDarkMode.titleAppBar),
          ],
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 15,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 6,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    return ProductItem(
                      size: size,
                      titel: 'ساعت مچی هوشمند مدل Ultra Sport بند سیلیکونی',
                      pric: 50000,
                      imgeProduct: ImagePath.slider2,
                      discount: 6,
                      pricDiscount: 400000,
                       onTap: () {  },
                    );
                  },
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
