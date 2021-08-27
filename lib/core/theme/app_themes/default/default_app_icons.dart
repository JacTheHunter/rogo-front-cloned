import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../configs/constants/app_images.dart';
import '../../../presentation/pages/widgets/app_image.dart';
import '../../app_color_scheme.dart';
import '../../app_icons.dart';

class DefaultAppIcons extends AppIcons {
  @override
  Widget get textButtonArrowRightIcon => Icon(
        CupertinoIcons.arrow_right,
        color: AppColorScheme.white,
        size: 16,
      );
  @override
  Widget get inputEyeIcon => AppImage.asset(
        AppImages.vector.eye,
        color: AppColorScheme.haiti,
      );
  @override
  Widget get searchIcon => AppImage.asset(
        AppImages.vector.search,
      );
  @override
  Widget get searchFilterIcon => AppImage.asset(
        AppImages.vector.filter,
        height: 20,
        width: 24,
      );
  @override
  Widget get inputEyeOffIcon => AppImage.asset(
        AppImages.vector.eyeOff,
        color: AppColorScheme.haiti,
      );
  @override
  Widget get dropDownIcon => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColorScheme.white,
        ),
        child: Center(
          child: Icon(
            CupertinoIcons.chevron_down,
            size: 20,
          ),
        ),
      );
  @override
  Widget get textButtonArrowLeftIcon => Icon(
        CupertinoIcons.arrow_left,
        color: AppColorScheme.hollywoodCerise,
        size: 16,
      );
  @override
  Widget get simpleButtonArrowRightIcon => Icon(
        CupertinoIcons.arrow_right,
        color: AppColorScheme.white,
        size: 16,
      );
  @override
  Widget get numberPadErraseIcon => Icon(
        Icons.backspace_outlined,
        size: 23,
        color: AppColorScheme.redOrange,
      );

  @override
  Widget get addLanguageButtonIcon => AppImage.asset(
        AppImages.vector.plus,
        width: 24,
        height: 24,
      );

  @override
  Widget get appBarArrowLeftIcon => Icon(
        CupertinoIcons.arrow_left,
        color: AppColorScheme.black,
        size: 16,
      );

  @override
  Widget get textButtonCheckboxIcon => Icon(
        CupertinoIcons.check_mark,
        color: AppColorScheme.hollywoodCerise,
        size: 16,
      );

  @override
  Widget get languageItemSelectedCheckboxIcon => AppImage.asset(
        AppImages.vector.checkbox,
        width: 28,
        height: 28,
      );

  @override
  Widget get favoriteIcon => AppImage.asset(AppImages.vector.heart);

  @override
  Widget get browseItemArrowLeftIcon => AppImage.asset(AppImages.vector.arrowLeftWithOpacity, width: 38);

  @override
  Widget get browseItemEmptyHeartIcon => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 9,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.white,
          child: AppImage.asset(
            AppImages.vector.heartEmpty,
            color: AppColorScheme.hollywoodCerise,
            width: 33,
          ),
        ),
      );

  @override
  Widget get locationIconWithPinkTone => Container(
        height: 24,
        width: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColorScheme.pinkLace,
          borderRadius: BorderRadius.circular(4),
        ),
        child: AppImage.asset(
          AppImages.vector.location,
          height: 14,
        ),
      );

  Widget get searchClearIcon => AppImage.asset(
        AppImages.vector.xCircle,
        height: 20,
        color: AppColorScheme.hollywoodCerise,
      );
}
