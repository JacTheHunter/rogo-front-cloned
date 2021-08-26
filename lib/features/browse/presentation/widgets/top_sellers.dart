import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/configs/constants/app_images.dart';

import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../cubit/top_sellers_cubit.dart';
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
            style: context
                .read<AppThemeCubit>()
                .state
                .textTheme()
                .browseTitleTextStyle(),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 180,
            //  width: 100,
            child: BlocBuilder<TopSellersCubit, TopSellersState>(
              builder: (context, state) {
                if (state.errorMessage.isNotEmpty) {
              
                  return Center(
                    child: AppText(state.errorMessage),
                  );
                } else if (state.isLoading) {
                  //TODO: replace this widget with AppLoader
                  
                  return CircularProgressIndicator();
                } else {
      
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.topSellers.length,
                    itemBuilder: (context, i) => TopSellerItem(
                      name: state.topSellers[i].seller['full_name'],
                      bannerImage: state.topSellers[i].image,
                      avatarImage: state.topSellers[i].seller['avatar'] ??
                          AppImages.raster.browseItemProfileImage,
                      rating: (state.topSellers[i].seller['rating'] as num)
                          .toDouble(),
                      reviews: (state.topSellers[i].seller['reviews'] as num)
                          .toInt(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
