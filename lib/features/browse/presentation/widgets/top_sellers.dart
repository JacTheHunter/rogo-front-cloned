import 'package:flutter/material.dart';
import 'package:rogo/core/configs/constants/app_images.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/features/browse/presentation/widgets/top_seller_item.dart';


class TopSellers extends StatelessWidget {
  const TopSellers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'browse.browsePage.topSellers',
            style: context.read<AppThemeCubit>().state.textTheme().browseTitleTextStyle(),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 180,
            //  width: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TopSellerItem(
                  name: 'Kathryn Murphy',
                  bannerImage: AppImages.raster.sellerBannerRandom,
                  avatarImage: AppImages.raster.sellerAvatarRandom,
                  rating: 4.9,
                  reviews: 10,
                ),
                TopSellerItem(
                  name: 'Darrell Steward',
                  bannerImage: AppImages.raster.sellerBannerRandom,
                  avatarImage: AppImages.raster.sellerAvatarRandom,
                  rating: 5.0,
                  reviews: 10,
                ),
                TopSellerItem(
                  name: 'Kathryn Murphy',
                  bannerImage: AppImages.raster.sellerBannerRandom,
                  avatarImage: AppImages.raster.sellerAvatarRandom,
                  rating: 4.9,
                  reviews: 10,
                ),
                TopSellerItem(
                  name: 'Darrell Steward',
                  bannerImage: AppImages.raster.sellerBannerRandom,
                  avatarImage: AppImages.raster.sellerAvatarRandom,
                  rating: 5.0,
                  reviews: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
