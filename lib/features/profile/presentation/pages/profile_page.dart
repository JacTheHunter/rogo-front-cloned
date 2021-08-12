import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';

import '../../../../core/configs/constants/app_images.dart';
import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../browse/data/repositories/widgets/recomended_item.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: context.read<AppThemeCubit>().state.appColors().scaffoldBackgroundColor(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: context.read<AppThemeCubit>().state.appColors().createAccountHeaderGradient(),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(28),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: context.read<AppThemeCubit>().state.appColors().profileAvatarBackgroundColor(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: AppText(
                                'CA',
                                style: context.read<AppThemeCubit>().state.textTheme().profileAvatarLettersTextStyle(),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                'Vladlena Dufresne',
                                style: context.read<AppThemeCubit>().state.textTheme().profileNameTextStyle(),
                              ),
                              SizedBox(height: 4),
                              AppText(
                                '10 reviews ',
                                style: context.read<AppThemeCubit>().state.textTheme().profileReviewsTextStyle(),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            SliverAppBar(
              backgroundColor: context.read<AppThemeCubit>().state.appColors().sliverAppBarBackgroundColor(),
              //  expandedHeight: 160,
              elevation: 0,

              snap: true,
              floating: true,
              expandedHeight: 84,
              toolbarHeight: 70,

              flexibleSpace: Container(
                color: context.read<AppThemeCubit>().state.appColors().sliverAppBarBackgroundColor(),
                padding: const EdgeInsets.only(top: 20, left: 20, bottom: 12),
                child: TabBar(
                  indicatorColor: context.read<AppThemeCubit>().state.appColors().primaryColor(),
                  labelStyle: context.read<AppThemeCubit>().state.textTheme().tabBarSelectedLabelTextStyle(),
                  unselectedLabelStyle:
                      context.read<AppThemeCubit>().state.textTheme().tabBarUnSelectedLabelTextStyle(),
                  labelColor: context.read<AppThemeCubit>().state.appColors().primaryTextColor(),
                  unselectedLabelColor: context.read<AppThemeCubit>().state.appColors().hintColor(),
                  isScrollable: true,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: context.read<AppThemeCubit>().state.appColors().primaryColor(),
                      width: 2,
                    ),
                    //  insets: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                  ),
                  indicatorPadding: EdgeInsets.only(right: 40),
                  labelPadding: EdgeInsets.only(right: 40),
                  tabs: [
                    Tab(
                      text: translate('browse.browsePage.feed'),
                    ),
                    Tab(
                      text: translate('browse.browsePage.liveSearch'),
                    ),
                  ],
                  // controller: _tabController,
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              Builder(builder: (context) {
                return ListView(
                  shrinkWrap: true,
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
                );
              }),
              Builder(
                builder: (context) {
                  return ListView(
                    shrinkWrap: true,
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
