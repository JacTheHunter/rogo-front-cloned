import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../core/configs/constants/app_images.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../widgets/feed_item.dart';
import '../widgets/live_search_item.dart';

//TODO: FIX LISTVIEW OVERLAY AT BOTTOM
class WhishListsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: context.appColors.sliverWishlistsAppBarBackgroundColor,
            toolbarHeight: 120,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: Container(
                width: double.infinity,
                color: context.appColors.sliverWishlistsAppBarBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppText(
                        "Wishlists",
                        maxLines: 1,
                        style: context.appTextTheme.sliverHeaderTitleTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverAppBar(
            backgroundColor: context.appColors.sliverWishlistsAppBarBackgroundColor,
            elevation: 0,
            snap: true,
            floating: true,
            expandedHeight: 84,
            toolbarHeight: 70,
            flexibleSpace: Container(
              color: AppColorScheme.whitePointer,
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
                    text: translate('wishlists.wishlistsPage.feed'),
                  ),
                  Tab(
                    text: translate('wishlists.wishlistsPage.liveSearch'),
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
                color: context.appColors.sliverWishlistsAppBarBackgroundColor,
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (contex, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: FeedItem(
                      image: AppImages.raster.productRandom,
                    ),
                  ),
                ),
              );
            }),
            Builder(
              builder: (context) {
                return Container(
                  color: context.appColors.sliverWishlistsAppBarBackgroundColor,
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (contex, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: LiveSearchItem(
                        image: AppImages.raster.productRandom,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
