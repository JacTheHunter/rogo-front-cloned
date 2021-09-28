import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../core/configs/constants/app_images.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../browse/presentation/widgets/recomended_item.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: context.appColors.scaffoldBackgroundColor,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: context.appColors.createAccountHeaderGradient,
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
                              color: context.appColors.profileAvatarBackgroundColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: AppText(
                                'CA',
                                style: context.appTextTheme.profileAvatarLettersTextStyle,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                'Vladlena Dufresne',
                                style: context.appTextTheme.profileNameTextStyle,
                              ),
                              SizedBox(height: 4),
                              AppText(
                                '10 reviews ',
                                style: context.appTextTheme.profileReviewsTextStyle,
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
              backgroundColor: context.appColors.sliverAppBarBackgroundColor,
              //  expandedHeight: 160,
              elevation: 0,

              snap: true,
              floating: true,
              expandedHeight: 84,
              toolbarHeight: 70,

              flexibleSpace: Container(
                color: context.appColors.sliverAppBarBackgroundColor,
                padding: const EdgeInsets.only(top: 20, left: 20, bottom: 12),
                child: TabBar(
                  indicatorColor: context.appColors.primaryColor,
                  labelStyle: context.appTextTheme.tabBarSelectedLabelTextStyle,
                  unselectedLabelStyle: context.appTextTheme.tabBarUnSelectedLabelTextStyle,
                  labelColor: context.appColors.primaryTextColor,
                  unselectedLabelColor: context.appColors.hintColor,
                  isScrollable: true,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: context.appColors.primaryColor,
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
                return Container(
                  color: context.appColors.sliverAppBarBackgroundColor,
                  padding: const EdgeInsets.all(20),
                  child: ListView(
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
                  ),
                );
              }),
              Builder(
                builder: (context) {
                  return Container(
                    color: context.appColors.sliverAppBarBackgroundColor,
                    padding: const EdgeInsets.all(20),
                    child: ListView(
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
                    ),
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
