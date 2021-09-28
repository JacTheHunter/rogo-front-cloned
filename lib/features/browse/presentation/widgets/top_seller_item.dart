import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../core/configs/constants/app_images.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../core/presentation/pages/widgets/app_image.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';

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
          AppImage.network(
            bannerImage,
            width: 220,
            height: 120,
            fit: BoxFit.cover,
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
              // SizedBox(width: 16.2),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 128,
                    child: AppText(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextTheme.topSellerNameTextStyle,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      AppText(
                        rating.toString(),
                        style: context.appTextTheme.topSellerRatingTextStyle,
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
                        style: context.appTextTheme.topSellerReviewsTextStyle,
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
