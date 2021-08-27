import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/constants/app_images.dart';
import '../../../theme/app_color_scheme.dart';
import '../../blocs/app_theme_cubit/app_theme_cubit.dart';
import 'app_image.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onNavItemTap;
  const AppBottomNavBar({Key? key, required this.currentIndex, required this.onNavItemTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsetsDirectional.all(20),
      decoration: BoxDecoration(
        color: AppColorScheme.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
        boxShadow: [
          BoxShadow(
            color: context.read<AppThemeCubit>().state.appColors.appbarShadowColor,
            blurRadius: 24,
            offset: Offset(0, -4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => onNavItemTap(0),
            child: AppImage.asset(
              currentIndex == 0 ? AppImages.vector.appbarBrowseSelected : AppImages.vector.appbarBrowse,
              width: 28,
              height: 30,
            ),
          ),
          GestureDetector(
            onTap: () => onNavItemTap(1),
            child: AppImage.asset(
              currentIndex == 1 ? AppImages.vector.appbarWishlistSelected : AppImages.vector.appbarWishlist,
              width: 28,
              height: 26,
            ),
          ),
          GestureDetector(
            onTap: () => onNavItemTap(2),
            child: AppImage.asset(
              currentIndex == 2 ? AppImages.vector.appbarAddSelected : AppImages.vector.appbarAdd,
              width: 32,
              height: 32,
            ),
          ),
          GestureDetector(
            onTap: () => onNavItemTap(3),
            child: AppImage.asset(
              currentIndex == 3 ? AppImages.vector.appbarInboxSelected : AppImages.vector.appbarInbox,
              width: 40,
              height: 26,
            ),
          ),
          GestureDetector(
            onTap: () => onNavItemTap(4),
            child: AppImage.asset(
              currentIndex == 4 ? AppImages.vector.appbarProfileSelected : AppImages.vector.appbarProfile,
              width: 22,
              height: 28,
            ),
          ),
        ],
      ),
    );
  }
}
