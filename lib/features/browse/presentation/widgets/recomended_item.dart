import 'package:flutter/material.dart';
import 'package:rogo/core/configs/constants/app_images.dart';
import 'package:rogo/core/presentation/pages/widgets/app_image.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedItem extends StatelessWidget {
  final String image;
  const RecommendedItem({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: context
            .read<AppThemeCubit>()
            .state
            .appColors()
            .productItemBackgroundColor(),
      ),
      child: Column(
        children: [
          AppImage.asset(
            image,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(14),
              topLeft: Radius.circular(14),
            ),
            fit: BoxFit.fitHeight,
            width: double.infinity,
            //  height: 100,
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(
                      '\$100',
                      style: context
                          .read<AppThemeCubit>()
                          .state
                          .textTheme()
                          .productItemPriceNumberTextStyle(),
                    ),
                    SizedBox(width: 2),
                    AppText(
                      'p/month',
                      style: context
                          .read<AppThemeCubit>()
                          .state
                          .textTheme()
                          .productItemPriceTextStyle(),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                AppText(
                  'Сamera lens',
                  style: context
                      .read<AppThemeCubit>()
                      .state
                      .textTheme()
                      .productItemNameTextStyle(),
                ),
                SizedBox(height: 11),
                Row(
                  children: [
                    AppImage.asset(
                      AppImages.vector.location,
                      height: 8,
                    ),
                    SizedBox(width: 5),
                    AppText(
                      'Camas, WA',
                      style: context
                          .read<AppThemeCubit>()
                          .state
                          .textTheme()
                          .productItemLocationTextStyle(),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
