import 'package:firsteconomy/core/constant/constant.dart';
import 'package:firsteconomy/core/themes/app_colors.dart';
import 'package:firsteconomy/features/domain/entity/banner_entity.dart';
import 'package:firsteconomy/features/presentation/bloc/image_slider_cubit/image_slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatelessWidget {
  final List<BannerEntity> banners;

  const ImageSlider({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImageSliderCubit(imageList: banners.length),
      child: BlocBuilder<ImageSliderCubit, int>(
        builder: (context, state) {
          final cubit = context.read<ImageSliderCubit>();

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstantWidgets.hight20(context),
              SizedBox(
               height: MediaQuery.of(context).size.height * 0.18,
                width: double.infinity,
                child: PageView.builder(
                  controller: cubit.pageController,
                  onPageChanged: cubit.updatePage,
                  itemCount: banners.length,
                  itemBuilder: (context, index) {
                    final banner = banners[index];
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          banner.bannerImage,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                color: AppPalette.blueColor,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LucideIcons.image,
                                      size: 40,
                                      color: AppPalette.greyColor,
                                    ),
                                    ConstantWidgets.hight10(context),
                                    Text(
                                      'Image not found',
                                      style: TextStyle(
                                        color: AppPalette.greyColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'Having trouble loading the image.',
                                      style: TextStyle(
                                        color: AppPalette.greyColor,
                                        fontSize: 7,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              ConstantWidgets.hight20(context),
              SmoothPageIndicator(
                controller: cubit.pageController,
                count: banners.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 6,
                  dotWidth: 16,
                  activeDotColor: AppPalette.blueColor,
                  dotColor: Colors.grey,
                  expansionFactor: 2,
                  spacing: 6,
                ),
              ),
              ConstantWidgets.hight10(context),
            ],
          );
        },
      ),
    );
  }
}
