import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/configs/constants/app_images.dart';
import '../../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../../core/presentation/pages/widgets/app_gradient_bottom_nav_bar.dart';
import '../../../../../core/presentation/pages/widgets/app_image.dart';
import '../../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../../core/presentation/pages/widgets/haiti_button.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../widgets/slider_image.dart';

class BrowseItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColorScheme.mercury,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColorScheme.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SliderImage(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 19,
                        top: 10,
                        bottom: 8,
                      ),
                      child: Row(
                        children: [
                          AppText(
                            '\$50',
                            style: context.read<AppThemeCubit>().state.textTheme.browseItemPriceNumberTextStyle,
                          ),
                          SizedBox(width: 10),
                          AppText(
                            'p/day',
                            style: context.read<AppThemeCubit>().state.textTheme.browseItemPriceTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 4),
                      child: AppText(
                        'Pioneer surfboards',
                        style: context.read<AppThemeCubit>().state.textTheme.browseItemNameTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 22),
                      child: Row(
                        children: [
                          context.read<AppThemeCubit>().state.appIcons.locationIconWithPinkTone,
                          SizedBox(width: 5),
                          AppText(
                            'Camas, WA',
                            style: context.read<AppThemeCubit>().state.textTheme.browseItemLocationTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: AppColorScheme.remi,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(height: 24),
                    ...textBlockReturn(
                        'browse.browseItemPage.description',
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                        context),
                    ...textBlockReturn(
                        'browse.browseItemPage.pickUpAndDrop',
                        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                        context),
                    ...textBlockReturn(
                        'browse.browseItemPage.itemUponReturn',
                        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                        context),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  color: AppColorScheme.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: AppText(
                                    'Vladlena Dufresne',
                                    style: context.read<AppThemeCubit>().state.textTheme.itemDescriptionTitle,
                                  ),
                                ),
                                ExpandableText(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                                  expandText: 'read more',
                                  collapseText: 'read less',
                                  linkEllipsis: false,
                                  maxLines: 3,
                                  linkColor: AppColorScheme.hollywoodCerise,
                                  linkStyle: context.read<AppThemeCubit>().state.textTheme.itemDescription,
                                  style: context.read<AppThemeCubit>().state.textTheme.itemDescription,
                                )
                                // AppText(
                                //   'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat... ',
                                //   style: context
                                //       .read<AppThemeCubit>()
                                //       .state
                                //       .textTheme()
                                //       .itemDescription(),
                                // ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: AppImage.asset(
                              AppImages.raster.browseItemProfileImage,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 9),
                      child: Row(
                        children: [
                          AppText(
                            '5,0',
                            style: context.read<AppThemeCubit>().state.textTheme.browseItemRatingNumberTextStyle,
                          ),
                          SizedBox(width: 4.75),
                          AppImage.asset(AppImages.vector.star),
                          SizedBox(width: 16.75),
                          AppText(
                            '10 reviews',
                            style: context.read<AppThemeCubit>().state.textTheme.browseItemRatingTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 38.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'Joined in December 2021',
                            style: context.read<AppThemeCubit>().state.textTheme.browseItemRatingTextStyle,
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              AppText(
                                'Languages: ',
                                style: context.read<AppThemeCubit>().state.textTheme.browseItemRatingTextStyle,
                              ),
                              AppText(
                                'English, Spanish',
                                style: context.read<AppThemeCubit>().state.textTheme.browseItemLanguagesTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: HaitiButton(
                        text: 'Send message',
                      ),
                    ),
                    SizedBox(height: 150)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppGradientBottomNavBar(),
    );
  }
}

List<Widget> textBlockReturn(String title, String body, BuildContext context) {
  return [
    Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 4),
      child: AppText(
        title,
        style: context.read<AppThemeCubit>().state.textTheme.itemDescriptionTitle,
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
      child: AppText(
        body,
        style: context.read<AppThemeCubit>().state.textTheme.itemDescription,
      ),
    ),
  ];
}
