import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:rogo/core/configs/constants/app_images.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/core/presentation/pages/widgets/app_image.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/features/browse/data/repositories/widgets/categories.dart';
import 'package:rogo/features/browse/data/repositories/widgets/recommended.dart';
import 'package:rogo/features/browse/data/repositories/widgets/top_sellers.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        //   floatHeaderSlivers: true,

        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: context.read<AppThemeCubit>().state.appColors().sliverAppBarBackgroundColor(),

              toolbarHeight: 120,
              floating: false,
              // pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,

                //  centerTitle: true,
                title: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage(
                        AppImages.raster.sliverOverlay,
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppText(
                          "Welcome Text",
                          maxLines: 1,
                          style: context.read<AppThemeCubit>().state.textTheme().sliverHeaderTitleTextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                background: AppImage.asset(
                  AppImages.raster.sliverOverlay,
                  //TODO: FIX COLOR
                  color: Color(0xFFFDD3FD),
                ),
              ),
            ),
            SliverAppBar(
              backgroundColor: context.read<AppThemeCubit>().state.appColors().sliverAppBarBackgroundColor(),
              //  expandedHeight: 160,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(28),
              )),
              snap: true,
              floating: true,
              toolbarHeight: 174,
              // pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                //  centerTitle: true,

                title: Container(
                  color: context.read<AppThemeCubit>().state.appColors().sliverAppBarBackgroundColor(),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TabBar(
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
                      SizedBox(
                        height: 24,
                      ),
                      AppTextFormField(
                        fillColor: context.read<AppThemeCubit>().state.appColors().sliverAppBarSearchFillolor(),
                        prefixIconConstraints: BoxConstraints(maxHeight: 18),
                        prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 10),
                            child: context.read<AppThemeCubit>().state.appIcons().searchIcon()),
                        suffixIconConstraints: BoxConstraints(maxHeight: 20),
                        suffixIcon: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 16),
                            child: context.read<AppThemeCubit>().state.appIcons().searchFilterIcon()),
                        hintText: 'browse.browsePage.whatAreYouLookingFor',
                        hintStyle: context.read<AppThemeCubit>().state.textTheme().searchInputHintTextStyle(),
                      ),
                      SizedBox(height: 18),
                    ],
                  ),
                ),
                background: AppImage.asset(
                  AppImages.raster.sliverOverlay,
                  //TODO: FIX COLOR
                  color: Color(0xFFFDD3FD),
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
