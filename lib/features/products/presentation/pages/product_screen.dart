import 'package:flutter/material.dart';
import 'package:veloshop/core/constants/assets_path/image_path.dart';
import 'package:veloshop/core/constants/dimens.dart';
import 'package:veloshop/core/extention/sizboxextension.dart';
import 'package:veloshop/core/theme/elevated_button/elevatedButtonStyle.dart';
import 'package:veloshop/core/theme/text_style/dark_text_style.dart';
import 'package:veloshop/core/utils/productVideoPlayer.dart';
import 'package:veloshop/core/widgets/appBarCostum.dart';
import 'package:video_player/video_player.dart';
import 'package:veloshop/core/utils/productAudioPlayer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://samples.tdarr.io/api/v1/samples/sample__720__libx264__libmp3lame__30s__video.mp4',
      ),
    );

    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    await _videoController.initialize();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarCustom(
        size: size,
        child: Row(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [Text('جزئیات محصول')],
        ),
      ),

      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  expandedHeight: size.width,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.fromLTRB(8, 16, 8, 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppDimers.medium),
                      child: Image.asset(ImagePath.slider3, fit: BoxFit.cover),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .start,
                    children: [
                      SizedBox(
                        width: size.width * .9,
                        child: Padding(
                          padding: const EdgeInsets.all(AppDimers.medium),
                          child: Text(
                            'هدفون بی‌‌سیم حرفه‌ای مدل Pro X Series 2026  ',
                            style: AppTextstyleDarkMode.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '۴٬۵۰۰٬۰۰۰ تومان',
                                  style: AppTextstyleDarkMode.priceDiscount,
                                ),
                                Text(
                                  '۳٬۸۰۰٬۰۰۰ تومان',
                                  style: AppTextstyleDarkMode.price.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),

                            (size.width * .3).width,

                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    AppDimers.medium,
                                  ),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                ),
                                child: const Text(
                                  'در انبار موجود است',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'معرفی محصول',
                          style: AppTextstyleDarkMode.title,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'تجربه‌ای بی‌نظیر از موسیقی با تکنولوژی حذف نویز فعال (ANC) و عمر باتری ۴۰ ساعته. طراحی ارگونومیک و مینیمال با استفاده از متریال درجه یک برای استفاده طولانی مدت بدون خستگی.',
                          style: AppTextstyleDarkMode.discripton,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.justify,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'ویدیو بررسی تخصصی',
                          style: AppTextstyleDarkMode.title,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppDimers.medium),
                          child: _videoController.value.isInitialized
                              ? ProductVideoPlayer(controller: _videoController)
                              : const AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'صدای بررسی تخصصی',
                          style: AppTextstyleDarkMode.title,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: ProductAudioPlayer(
                          audioUrl: 'https://dl.gisomusic.com/Music/1403/01/18/Moein%20-%20Esfehan%20(Live).mp3',
                        ),
                      ),

                      (size.height * .13).height,
                    ],
                  ),
                ),
              ],
            ),

            Positioned(
              bottom: 20,
              left: 16,
              right: 16,

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimers.large),
                ),

                child: ElevatedButton(
                  style: ElevatedButtonStyleDarkMod.mainElevatedButton,
                  
                  onPressed: () {},
                   child: Text('افزودن به سبدخرید', style: AppTextstyleDarkMode.btmNavActive,)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
