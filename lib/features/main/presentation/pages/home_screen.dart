import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veloshop/core/constants/assets_path/image_path.dart';
import 'package:veloshop/core/constants/dimens.dart';
import 'package:veloshop/core/extention/sizboxextension.dart';
import 'package:veloshop/core/theme/text_style/dark_text_style.dart';
import 'package:veloshop/core/widgets/appBarCostum.dart';
import 'package:veloshop/core/widgets/productItem.dart';
import 'package:veloshop/features/main/presentation/route/names.dart';
import 'package:veloshop/features/main/presentation/widgets/carouselSliderItem.dart';
import 'package:veloshop/features/main/presentation/widgets/labelTitle.dart';
import 'package:veloshop/features/products/presentation/pages/product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onMenuPressed});

  final VoidCallback onMenuPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarCustom(
        size: size,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('فروشگاه Velo', style: AppTextstyleDarkMode.titleAppBar),

            IconButton(
              onPressed: onMenuPressed,
              icon: const Icon(CupertinoIcons.list_bullet),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, realIndex) {
                return CarouselSliderItem(
                  title: 'عنوان',
                  imgPath: ImagePath.slider1,
                  left: realIndex == 0 ? 8 : 16,
                  right: realIndex == 5 - 1 ? 8 : 16,
                );
              },
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.8,
                aspectRatio: 1.2,
                initialPage: 0,
                disableCenter: true,
                enableInfiniteScroll: false,
                // autoPlay: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enlargeCenterPage: true,
                scrollPhysics: BouncingScrollPhysics(),
                padEnds: false,

                // reverse: true
              ),
            ),

            LabelTitle(label: 'دسته‌بندی‌ها', onTop: () {}),

            SizedBox(
              width: size.width,
              height: size.height * .1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == 0 ? 8 : 0,
                      left: index == 9 - 1 ? 8 : 0,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: size.width / 7,
                          height: size.height * .06,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppDimers.bigLarge,
                            ),
                            image: DecorationImage(
                              image: AssetImage(ImagePath.slider3),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Text('لباس مردانه'),
                      ],
                    ),
                  );
                },
              ),
            ),

            LabelTitle(label: 'محصولات تخفیف دار', onTop: () {}),

            SizedBox(
              width: size.width,
              height: size.height / 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == 0 ? 8 : 0,
                      left: index == 5 - 1 ? 8 : 0,
                    ),
                    child: ProductItem(
                      size: size,
                      titel:
                          'هدفون بی‌‌سیم حرفه‌ای مدل Pro X قشنگ و مشنگ و قشنگ',
                      pric: 700000,
                      imgeProduct: ImagePath.slider1,
                      pricDiscount: 4000000,
                      discount: 20,
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => ProductScreen(),) );
                      },
                    ),
                  );
                },
              ),
            ),

            LabelTitle(label: 'محصولات پیشنهادی ', onTop: () {}),

            SizedBox(
              width: size.width,
              height: size.height * .3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == 0 ? 8 : 0,
                      left: index == 5 - 1 ? 8 : 0,
                    ),
                    child: ProductItem(
                      size: size,
                      titel: 'گوشی گلکسی S23',
                      pric: 80000,
                      imgeProduct: ImagePath.slider3,
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),

            AppDimers.bigLarge.height,
          ],
        ),
      ),
    );
  }
}
