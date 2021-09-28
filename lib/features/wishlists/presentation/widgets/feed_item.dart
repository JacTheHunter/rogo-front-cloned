import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/constants/app_images.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../core/presentation/pages/widgets/app_image.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';

class FeedItem extends StatelessWidget {
  final String image;

  const FeedItem({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 12),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: context.appColors.productItemBackgroundColor,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppImage.asset(
            image,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              bottomLeft: Radius.circular(14),
            ),
            width: MediaQuery.of(context).size.width * 0.32, // overflow fix
            fit: BoxFit.cover,
            // width: double.infinity,
          ),
          SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.52,
                  child: Row(
                    children: [
                      AppText(
                        '\$50',
                        style: context.appTextTheme.wishlistsProductItemPriceNumberTextStyle,
                      ),
                      SizedBox(width: 4),
                      AppText(
                        'p/day',
                        style: context.appTextTheme.wishlistsProductItemPriceTextStyle,
                      ),
                      Spacer(),
                      context.appIcons.favoriteIcon,
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width * 0.46,
                  child: AppText(
                    'Vinyl Photography Background',
                    maxLines: 2,
                    style: context.appTextTheme.wishlistsProductItemNameTextStyle,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    AppImage.asset(
                      AppImages.vector.location,
                      height: 8,
                    ),
                    SizedBox(width: 5),
                    AppText(
                      'Camas, WA',
                      style: context.appTextTheme.productItemLocationTextStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
