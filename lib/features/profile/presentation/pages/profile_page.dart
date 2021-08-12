import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rogo/core/configs/constants/app_colors.dart';
import 'package:rogo/core/theme/app_color_scheme.dart';

import '../../../../core/configs/constants/app_images.dart';
import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../browse/data/repositories/widgets/recomended_item.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocProvider<AppThemeCubit>(
        create: (context) => AppThemeCubit(),
        child: Scaffold(
          backgroundColor: context
              .read<AppThemeCubit>()
              .state
              .appColors()
              .scaffoldBackgroundColor(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(300),
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 211,
                    decoration: BoxDecoration(
                      gradient: context
                          .read<AppThemeCubit>()
                          .state
                          .appColors()
                          .createAccountHeaderGradient(),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(28),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 60,
                          child: Text(
                            'CA',
                            style: TextStyle(
                              color: AppColors.vividTangerine,
                              fontFamily: 'SanFranciscoProText',
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.forgetMeNot,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 80, left: 12),
                              child: Text(
                                'Vladlena Dufresne',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SanFranciscoPro',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: Text(
                                '10 reviews',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SanFranciscoPro',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: AppColorScheme.lilac,
                        labelColor: AppColors.haiti,
                        unselectedLabelStyle: TextStyle(
                          fontFamily: 'SanFranciscoProText',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                        labelStyle: TextStyle(
                          fontFamily: 'SanFranciscoProText',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: context
                            .read<AppThemeCubit>()
                            .state
                            .appColors()
                            .primaryColor(),
                        tabs: [
                          Tab(
                            child: Text(
                              'Feed',
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Live-search',
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(top: 24),
            child: TabBarView(
              children: [
                Column(
                  children: [
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
                Column(
                  //TODO:make another page
                  children: [Text('To be done')],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
