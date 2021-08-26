import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/configs/constants/app_images.dart';
import '../../../../../core/injection/injection_container.dart';
import '../../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../../core/presentation/pages/widgets/app_image.dart';
import '../../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../../core/services/navigation_service.dart';
import '../../../../../core/theme/app_color_scheme.dart';

class SliderImage extends StatelessWidget {
  const SliderImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int itemIndex, _) =>
              Stack(
            children: [
              AppImage.asset(
                AppImages.raster.productRandom,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.275,
                left: MediaQuery.of(context).size.width * .03,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColorScheme.haiti06,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    children: [
                      AppImage.asset(
                        AppImages.vector.imageIcon,
                      ),
                      SizedBox(width: 5),
                      AppText(
                        '${itemIndex + 1}/3',
                        style: context
                            .read<AppThemeCubit>()
                            .state
                            .textTheme
                            .browseItemImageCountTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          options: CarouselOptions(
            height: 276,
            autoPlay: false,
            enableInfiniteScroll: true,
            viewportFraction: 1,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .06,
          left: MediaQuery.of(context).size.width * .03,
          child: GestureDetector(
            onTap: () => sl<NavigatorService>().pop(),
            child: context
                .read<AppThemeCubit>()
                .state
                .appIcons
                .browseItemArrowLeftIcon,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.28,
          left: MediaQuery.of(context).size.width * 0.85,
          child: context
              .read<AppThemeCubit>()
              .state
              .appIcons
              .browseItemEmptyHeartIcon,
        ),
      ],
    );
  }
}