


import 'package:flutter/material.dart';
import 'package:veloshop/core/constants/dimens.dart';
import 'package:veloshop/core/extention/price_libel.dart';
import 'package:veloshop/core/extention/sizboxextension.dart';
import 'package:veloshop/core/theme/text_style/dark_text_style.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.size,
    required this.titel,
    required this.pric,
    this.pricDiscount,
    this.discount,
    required this.imgeProduct,
  });

  final Size size;
  final String imgeProduct;
  final String titel;
  final int pric;
  final int? pricDiscount;
  final int? discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: size.width / 2,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 41, 41, 41),
        borderRadius: BorderRadius.circular(AppDimers.medium + 5),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimers.medium),
                  topRight: Radius.circular(AppDimers.medium),
                ),
                child: Image.asset(
                  imgeProduct,
                  fit: BoxFit.cover,
                  width: size.width,
                  height: size.height / 6,
                ),
              ),

              SizedBox(
                width: size.width * .7,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppDimers.medium,
                    right: AppDimers.medium,
                    top: AppDimers.small
                  ),
                  child: Text(
                    titel,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextstyleDarkMode.title,
                  ),
                ),
              ),
              AppDimers.large.height,

              if (pricDiscount != null)
                Padding(
                  padding: EdgeInsets.only(
                    left: AppDimers.medium,
                    right: AppDimers.medium,
                  ),
                  child: Text(
                    '${pricDiscount!.separatByComma}تومان ',
                    style: AppTextstyleDarkMode.priceDiscount,
                  ),
                ),
              if (pricDiscount == null) AppDimers.large.height,

              Padding(
                padding: EdgeInsets.only(
                  left: AppDimers.medium,
                  right: AppDimers.medium,
                ),
                child: Text(
                  '${pric.withPriceLibel}تومان ',
                  style: AppTextstyleDarkMode.price,
                ),
              ),
            ],
          ),


          if (discount != null)
            Positioned(
              top: size.height * .1,
              left: size.width * .04,
              child: Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red.shade200,
                  borderRadius: BorderRadius.circular(AppDimers.bigLarge),
                ),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 126, 55, 245),
                    borderRadius: BorderRadius.circular(AppDimers.large),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${discount!.separatByComma}%',
                    style: AppTextstyleDarkMode.discount,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
