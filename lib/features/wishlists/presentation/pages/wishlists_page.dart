import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_loader.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../bloc/wishlists_feed_cubit/wishlists_feed_cubit.dart';
import '../bloc/wishlists_live_search_cubit/wishlists_live_search_cubit.dart';
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
            backgroundColor: context.read<AppThemeCubit>().state.appColors.sliverWishlistsAppBarBackgroundColor,
            toolbarHeight: 120,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: Container(
                width: double.infinity,
                color: context.read<AppThemeCubit>().state.appColors.sliverWishlistsAppBarBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppText(
                        "Wishlists",
                        maxLines: 1,
                        style: context.read<AppThemeCubit>().state.textTheme.sliverHeaderTitleTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverAppBar(
            backgroundColor: context.read<AppThemeCubit>().state.appColors.sliverWishlistsAppBarBackgroundColor,
            elevation: 0,
            snap: true,
            floating: true,
            expandedHeight: 50,
            toolbarHeight: 50,
            flexibleSpace: Container(
              color: AppColorScheme.whitePointer,
              padding: const EdgeInsets.only(left: 20),
              child: TabBar(
                indicatorColor: context.read<AppThemeCubit>().state.appColors.primaryColor,
                labelStyle: context.read<AppThemeCubit>().state.textTheme.tabBarSelectedLabelTextStyle,
                unselectedLabelStyle: context.read<AppThemeCubit>().state.textTheme.tabBarUnSelectedLabelTextStyle,
                labelColor: context.read<AppThemeCubit>().state.appColors.primaryTextColor,
                unselectedLabelColor: context.read<AppThemeCubit>().state.appColors.tabTextColor,
                isScrollable: true,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: context.read<AppThemeCubit>().state.appColors.primaryColor,
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
                color: context.read<AppThemeCubit>().state.appColors.sliverWishlistsAppBarBackgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlocBuilder<WishlistsFeedCubit, WishlistsFeedState>(
                  builder: (context, state) {
                    if (state.isLoading) return AppLoader();
                    if (!state.isLoading && state.wishlistsFeed.isEmpty) {
                      return Container();
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.wishlistsFeed.length,
                      itemBuilder: (contex, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: FeedItem(
                          state: state.wishlistsFeed[index],
                          //TODO: No pictures on server to display
                          image: state.wishlistsFeed[index].image,
                          // image: AppImages.raster.productRandom,
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            Builder(
              builder: (context) {
                return Container(
                  color: context.read<AppThemeCubit>().state.appColors.sliverWishlistsAppBarBackgroundColor,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BlocBuilder<WishlistsLiveSearchCubit, WishlistsLiveSearchState>(
                    builder: (context, state) {
                      if (state.isLoading) return AppLoader();
                      if (!state.isLoading && state.wishlistsLiveSearch.isEmpty) {
                        return Container();
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.wishlistsLiveSearch.length,
                        itemBuilder: (contex, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: LiveSearchItem(
                            image: state.wishlistsLiveSearch[index].image,
                            state: state.wishlistsLiveSearch[index],
                          ),
                        ),
                      );
                    },
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
