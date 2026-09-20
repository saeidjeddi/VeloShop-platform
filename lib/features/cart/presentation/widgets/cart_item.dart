
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veloshop/core/constants/dimens.dart';
import 'package:veloshop/core/extention/price_libel.dart';
import 'package:veloshop/core/extention/sizboxextension.dart';
import 'package:veloshop/core/theme/text_style/dark_text_style.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.size,
    required this.imgPath,
    required this.title,
    required this.price,
    this.discount,
    required this.onTopPlus,
    required this.onTopMinus,
    required this.quantity,
  });

  final Size size;
  final String imgPath;
  final String title;
  final int price;
  final int quantity;
  final int? discount;
  final VoidCallback onTopPlus;
  final VoidCallback onTopMinus;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        AppDimers.large,
        AppDimers.small,
        AppDimers.large,
        0,
      ),
      width: size.width,
      padding: EdgeInsets.symmetric(
        vertical: AppDimers.medium,
        horizontal: AppDimers.medium,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 41, 41, 41),
        borderRadius: BorderRadius.circular(AppDimers.medium),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // تصویر محصول
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimers.medium),
            child: Image.asset(
              imgPath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          AppDimers.medium.width,

          // اطلاعات محصول
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextstyleDarkMode.cartTitle,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        CupertinoIcons.delete,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                AppDimers.medium.height,

                // قیمت + تعداد
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: .start,
                        crossAxisAlignment: .start,
                        children: [
                          if(discount != null)
                            Text(
                              '${discount!.withPriceLibel}تومان',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextstyleDarkMode.priceDiscount,
                            ),
                          Text(
                            '${price.withPriceLibel}تومان',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextstyleDarkMode.price,
                          ),
                        ],
                      ),
                    ),

                    AppDimers.small.width,

                    // کنترل تعداد
                    Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 49, 48, 52),
                        borderRadius: BorderRadius.circular(AppDimers.medium),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: onTopPlus,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 40,
                              minHeight: 42,
                            ),
                            icon: const Icon(
                              CupertinoIcons.plus,
                              size: 18,
                              color: Colors.deepPurple,
                            ),
                          ),

                          Text(
                            quantity.separatByComma,
                            style: AppTextstyleDarkMode.cartCaption,
                          ),

                          IconButton(
                            onPressed: onTopMinus,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 40,
                              minHeight: 42,
                            ),
                            icon: const Icon(
                              CupertinoIcons.minus,
                              size: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
