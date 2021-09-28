import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/constants/app_images.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../core/presentation/pages/widgets/app_loader.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../bloc/cubit/top_sellers_cubit.dart';
import 'top_seller_item.dart';

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
            style: context.appTextTheme.browseTitleTextStyle,
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 180,
            //  width: 100,
            child: BlocBuilder<TopSellersCubit, TopSellersState>(
              builder: (context, state) {
                if (state.isLoading) return AppLoader();
                if (!state.isLoading && state.topSellers.isEmpty) {
                  return Container();
                }
                return ListView.builder(
                  itemCount: state.topSellers.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => TopSellerItem(
                    name: state.topSellers[index].seller.fullName,
                    bannerImage: state.topSellers[index].image,
                    avatarImage: AppImages.raster.sellerAvatarRandom,
                    rating: state.topSellers[index].seller.rating.toDouble(),
                    reviews: state.topSellers[index].seller.reviews.toInt(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
