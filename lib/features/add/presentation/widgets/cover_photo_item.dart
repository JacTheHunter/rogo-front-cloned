import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/constants/app_images.dart';
import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_image.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/theme/app_color_scheme.dart';

class CoverPhotoItem extends StatelessWidget {
  const CoverPhotoItem({
    Key? key,
    required this.querySize,
    required this.index,
  }) : super(key: key);

  final Size querySize;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Container(
            width: querySize.width * 0.41,
            height: querySize.width * 0.41,
            child: AppImage.asset(
              AppImages.raster.productRandom,
              fit: BoxFit.fill,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          if (index == 0)
            Positioned(
              top: querySize.height * .01,
              left: querySize.width * .02,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColorScheme.hollywoodCerise,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: AppText(
                  'Cover',
                  style: context.read<AppThemeCubit>().state.textTheme.photoLabelTextStyle,
                ),
              ),
            ),
          Positioned(
            top: querySize.height * .01,
            left: querySize.width * .31,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppColorScheme.haitiWithOpacity40,
              child: AppImage.asset(
                AppImages.vector.trashIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
