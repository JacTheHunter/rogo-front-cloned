import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../../core/configs/constants/app_images.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../../core/presentation/pages/widgets/app_image.dart';
import '../../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../../core/presentation/pages/widgets/app_text_form_field.dart';
import '../widgets/categories.dart';
import '../widgets/recommended.dart';
import '../widgets/top_sellers.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: context.appColors.sliverAppBarBackgroundColor,
              toolbarHeight: 80,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                title: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      child: AppImage.asset(
                        AppImages.raster.sliverOverlay,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: AppText(
                              "Welcome Text",
                              maxLines: 1,
                              style: context.appTextTheme.sliverHeaderTitleTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // background: AppImage.asset(
                //   AppImages.raster.sliverOverlay,
                //   //TODO: FIX COLOR
                //   color: Color(0xFFFDD3FD),
                // ),
              ),
            ),
            SliverAppBar(
              backgroundColor: context.appColors.sliverAppBarBackgroundColor,
              //  expandedHeight: 160,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(28),
              )),
              snap: true,
              floating: true,
              toolbarHeight: 155,
              // pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                //  centerTitle: true,

                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
                    color: context.appColors.sliverAppBarBackgroundColor,
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TabBar(
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
                      SizedBox(
                        height: 24,
                      ),
                      AppTextFormField(
                        fillColor: context.appColors.sliverAppBarSearchFillolor,
                        prefixIconConstraints: BoxConstraints(maxHeight: 18),
                        prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 10), child: context.appIcons.searchIcon),
                        suffixIconConstraints: BoxConstraints(maxHeight: 20),
                        suffixIcon: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 16),
                            child: context.appIcons.searchFilterIcon),
                        hintText: 'browse.browsePage.whatAreYouLookingFor',
                        hintStyle: context.appTextTheme.searchInputHintTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            Builder(builder: (context) {
              return ListView(
                shrinkWrap: true,
                children: [
                  //  SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
                  Catogies(),
                  TopSellers(),
                  Recommended(),
                ],
              );
            }),
            ListView.builder(
              itemBuilder: (context, index) => Text(
                index.toString(),
              ),
              itemCount: 100,
            ),
          ],
        ),
      ),
    );
  }
}
