import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rogo/core/configs/constants/app_routes.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/services/navigation_service.dart';

import '../../../../../core/configs/constants/app_images.dart';
import '../../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../../core/presentation/pages/widgets/app_text.dart';
import 'recomended_item.dart';

class Recommended extends StatelessWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> sl<NavigatorService>().pushNamed(AppRoutes.browseItemPage),
      child: Container(
        color: context.read<AppThemeCubit>().state.appColors().productsBackgroundColor(),
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'browse.browsePage.recommended',
              style: context.read<AppThemeCubit>().state.textTheme().browseTitleTextStyle(),
            ),
            SizedBox(height: 16),
            StaggeredGridView.countBuilder(
              primary: false,
              shrinkWrap: true,
              itemCount: 10,
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 9,
              itemBuilder: (context, index) => RecommendedItem(
                image: AppImages.raster.productRandom,
              ),
              staggeredTileBuilder: (index) => StaggeredTile.fit(2),
            ),
          ],
        ),
      ),
    );
  }
}
