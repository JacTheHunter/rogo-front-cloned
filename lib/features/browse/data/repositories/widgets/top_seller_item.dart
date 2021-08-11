import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:rogo/core/configs/constants/app_images.dart';
import 'package:rogo/core/presentation/pages/widgets/app_image.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSellerItem extends StatelessWidget {
  final String name;
  final String bannerImage;
  final String avatarImage;
  final double rating;
  final int reviews;
  const TopSellerItem(
      {Key? key,
      required this.name,
      required this.bannerImage,
      required this.avatarImage,
      required this.rating,
      required this.reviews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 220,
      padding: const EdgeInsets.only(right: 24),
      child: Column(
        children: [
          AppImage.asset(
            bannerImage,
            width: 220,
            height: 120,
            fit: BoxFit.contain,
            borderRadius: BorderRadius.circular(8),
          ),
          SizedBox(height: 9),
          Row(
            children: [
              AppImage.asset(
                avatarImage,
                width: 48,
                height: 48,
                fit: BoxFit.contain,
                borderRadius: BorderRadius.circular(12),
              ),
              Spacer(),
              Column(
                children: [
                  AppText(
                    name,
                    style: context.read<AppThemeCubit>().state.textTheme().topSellerNameTextStyle(),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      AppText(
                        rating.toString(),
                        style: context.read<AppThemeCubit>().state.textTheme().topSellerRatingTextStyle(),
                      ),
                      SizedBox(width: 4),
                      AppImage.asset(
                        AppImages.vector.star,
                        width: 16,
                        height: 15,
                      ),
                      SizedBox(width: 16),
                      AppText(
                        '$reviews ' + translate('browse.browsePage.reviews'),
                        style: context.read<AppThemeCubit>().state.textTheme().topSellerReviewsTextStyle(),
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
