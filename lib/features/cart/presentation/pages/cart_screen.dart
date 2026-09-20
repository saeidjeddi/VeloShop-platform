import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veloshop/core/constants/assets_path/image_path.dart';
import 'package:veloshop/core/constants/dimens.dart';
import 'package:veloshop/core/extention/sizboxextension.dart';
import 'package:veloshop/core/theme/elevated_button/elevatedButtonStyle.dart';
import 'package:veloshop/core/theme/text_style/dark_text_style.dart';
import 'package:veloshop/core/widgets/appBarCostum.dart';
import 'package:veloshop/features/cart/presentation/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarCustom(
        size: size,
        child: Row(
          children: [
            Text('سبد خرید من', style: AppTextstyleDarkMode.titleAppBar),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // پیشنهاد ویژه
            Container(
              margin: EdgeInsets.all(AppDimers.large),
              width: size.width,
              padding: EdgeInsets.symmetric(
                vertical: AppDimers.medium,
                horizontal: AppDimers.medium,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(80, 160, 87, 248),
                borderRadius: BorderRadius.circular(AppDimers.medium),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(CupertinoIcons.info),
                      AppDimers.medium.width,
                      Text('پیشنهاد ویژه!', style: AppTextstyleDarkMode.title),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      right: AppDimers.bigLarge,
                      top: AppDimers.medium,
                    ),
                    child: Text(
                      'هزینه ارسال برای سفارش شما رایگان محاسبه شد.',
                      style: AppTextstyleDarkMode.caption,
                    ),
                  ),
                ],
              ),
            ),

            // مزایا
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppDimers.large),
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: AppDimers.medium),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 41, 41, 41),
                borderRadius: BorderRadius.circular(AppDimers.medium),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.gpp_good_outlined, color: Colors.deepPurple),
                      Text('ضمانت اصالت', style: AppTextstyleDarkMode.caption),
                    ],
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.local_shipping_rounded,
                        color: Colors.deepPurple,
                      ),
                      Text('ارسال اکسپرس', style: AppTextstyleDarkMode.caption),
                    ],
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.access_time, color: Colors.deepPurple),
                      Text(
                        'بازگشت ۷ روزه',
                        style: AppTextstyleDarkMode.caption,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return CartItem(
                    size: size,
                    imgPath: ImagePath.slider2,
                    title: 'گوشی هوشمند سامسونگ مدل Galaxy S23 Ultra ۵G دو سیم کارت',
                    price: 400000000,
                    discount: 500000000,
                    onTopPlus: () {},
                    onTopMinus: () {},
                    quantity: 3,
                  );
                },
              ),
            ),

            AppDimers.medium.height,

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppDimers.medium),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 41, 41, 41),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'قیمت کالاها (۴)',
                        style: AppTextstyleDarkMode.caption,
                      ),
                      Text(
                        '۵۴٬۰۹۰٬۰۰۰ تومان',
                        style: AppTextstyleDarkMode.caption,
                      ),
                    ],
                  ),

                  AppDimers.medium.height,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'هزینه ارسال',
                        style: AppTextstyleDarkMode.caption,
                      ),
                      Text(
                        'رایگان',
                        style: AppTextstyleDarkMode.caption,
                      ),
                    ],
                  ),

                  AppDimers.medium.height,

                  const Divider(
                    color: Color.fromARGB(80, 255, 255, 255),
                  ),

                  AppDimers.medium.height,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'جمع کل سبد',
                        style: AppTextstyleDarkMode.title,
                      ),
                      Text(
                        '۵۴٬۰۹۰٬۰۰۰ تومان',
                        style: AppTextstyleDarkMode.title,
                      ),
                    ],
                  ),

                  AppDimers.medium.height,

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButtonStyleDarkMod.mainElevatedButton,
                      onPressed: () {},
                      child: const Text('تکمیل فرآیند خرید'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
