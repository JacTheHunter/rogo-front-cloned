import 'package:flutter/material.dart';
import 'package:rogo/core/configs/constants/app_images.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_item.dart';

class Catogies extends StatelessWidget {
  const Catogies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'browse.browsePage.categories',
            style: context.read<AppThemeCubit>().state.textTheme.browseTitleTextStyle,
          ),
          SizedBox(height: 16),
          SizedBox(
              height: 44,
              //  width: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryItem(text: 'Events', icon: AppImages.raster.categoryRandom),
                  CategoryItem(text: 'Technology', icon: AppImages.raster.categoryRandom),
                  CategoryItem(text: 'Events', icon: AppImages.raster.categoryRandom),
                  CategoryItem(text: 'Technology', icon: AppImages.raster.categoryRandom),
                ],
              )),

          // ListView(
          //   scrollDirection: Axis.horizontal,
          // )
        ],
      ),
    );
  }
}
