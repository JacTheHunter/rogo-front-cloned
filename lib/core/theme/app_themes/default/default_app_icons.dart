import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rogo/core/configs/constants/app_images.dart';
import 'package:rogo/core/presentation/pages/widgets/app_image.dart';
import 'package:rogo/core/theme/app_icons.dart';

import '../../app_color_scheme.dart';

class DefaultAppIcons extends AppIcons {
  @override
  Widget textButtonArrowRightIcon() {
    return Icon(
      CupertinoIcons.arrow_right,
      color: AppColorScheme.hollywoodCerise,
      size: 16,
    );
  }

  @override
  Widget inputEyeIcon() {
    return AppImage.asset(
      AppImages.vector.eye,
      color: AppColorScheme.haiti,
    );
  }

  @override
  Widget searchIcon() {
    return AppImage.asset(
      AppImages.vector.search,
    );
  }

  @override
  Widget searchFilterIcon() {
    return AppImage.asset(
      AppImages.vector.filter,
      height: 20,
      width: 24,
    );
  }

  @override
  Widget inputEyeOffIcon() {
    return AppImage.asset(
      AppImages.vector.eyeOff,
      color: AppColorScheme.haiti,
    );
  }

  @override
  Widget dropDownIcon() {
    return Container(
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
  }

  @override
  Widget textButtonArrowLeftIcon() {
    return Icon(
      CupertinoIcons.arrow_left,
      color: AppColorScheme.hollywoodCerise,
      size: 16,
    );
  }

  @override
  Widget simpleButtonArrowRightIcon() {
    return Icon(
      CupertinoIcons.arrow_right,
      color: AppColorScheme.white,
      size: 16,
    );
  }

  @override
  Widget numberPadErraseIcon() {
    return Icon(
      Icons.backspace_outlined,
      size: 23,
      color: AppColorScheme.redOrange,
    );
  }

  @override
  Widget favoriteIcon() {
    return AppImage.asset(AppImages.vector.heart);
  }

  @override
  Widget browseItemArrowLeftIcon() {
    return AppImage.asset(
      AppImages.vector.arrowLeftWithOpacity,
      width: 38,
    );
  }

  @override
  Widget browseItemEmptyHeartIcon() {
    return Container(
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
  }

  @override
  Widget locationIconWithPinkTone() {
    return Container(
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
  }
}
