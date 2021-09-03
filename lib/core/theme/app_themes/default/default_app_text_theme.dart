import 'dart:ui';

import 'package:flutter/material.dart';

import '../../app_color_scheme.dart';
import '../../app_text_theme.dart';

class DefaultAppTextTheme extends AppTextTheme {
  @override
  TextStyle get onboardingTitleTextStyle => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 36,
      );

  @override
  TextStyle get onboardingTextStyle => TextStyle(
        fontSize: 16,
        color: AppColorScheme.manatee,
      );

  @override
  TextStyle get onboardingCrossedTextStyle => onboardingTextStyle..copyWith(decoration: TextDecoration.lineThrough);

  @override
  TextStyle get textButtonTextStyle => TextStyle(
        color: AppColorScheme.hollywoodCerise,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );

  @override
  TextStyle get authenticationTitleTextStyle => TextStyle(fontSize: 36);

  @override
  TextStyle get inputLabelTextStyle => TextStyle(
        fontSize: 14,
        color: AppColorScheme.regentGray,
      );

  @override
  TextStyle get inputErrorTextStyle => TextStyle(
        fontSize: 12,
        color: AppColorScheme.pomegranate,
      );

  @override
  TextStyle get simpleButtonTextStyle => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColorScheme.white,
      );

  @override
  TextStyle get authenticationSubTitleTextStyle => TextStyle(
        fontSize: 14,
        color: AppColorScheme.regentGray,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get authenticationTextStyle => TextStyle(
        color: AppColorScheme.pickledBluewood,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get privacyLinkTextStyle => privacyTextStyle.copyWith(
        color: AppColorScheme.hollywoodCerise,
      );

  @override
  TextStyle get privacyTextStyle => TextStyle(
        color: AppColorScheme.pickledBluewood,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get createAccountHeaderTitleTextStyle => TextStyle(
        color: AppColorScheme.white,
        fontSize: 28,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get createAccountTitleTextStyle => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get createAccountHeaderBiggerNumberTextStyle => TextStyle(
        color: AppColorScheme.frenchLilac,
        fontSize: 24,
      );

  @override
  TextStyle get createAccountHeaderTextStyle => TextStyle(
        color: AppColorScheme.frenchLilac,
        fontSize: 16,
      );

  @override
  TextStyle get inputTextStyle => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColorScheme.ebonyClay,
      );

  @override
  TextStyle get inputHintTextStyle => TextStyle(
        fontSize: 14,
        color: AppColorScheme.regentGray,
      );

  @override
  TextStyle get searchInputHintTextStyle => TextStyle(
        fontSize: 14,
        color: AppColorScheme.lilac,
      );

  TextStyle get inputGroupTitleTextStyle => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColorScheme.haiti,
      );

  @override
  TextStyle get confirmPhoneSubtitleTextStyle => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColorScheme.regentGray,
      );

  @override
  TextStyle get confirmPhoneSelectedNumberTextStyle => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        color: AppColorScheme.white,
      );

  @override
  TextStyle get confirmPhoneNumberPadTextStyle => TextStyle(
        fontSize: 36,
        color: AppColorScheme.black,
      );

  @override
  TextStyle get sliverHeaderTitleTextStyle => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get tabBarSelectedLabelTextStyle => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get tabBarUnSelectedLabelTextStyle => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColorScheme.lilac,
      );

  @override
  TextStyle get browseTitleTextStyle => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get browseCategoryTextStyle => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get topSellerNameTextStyle => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get topSellerRatingTextStyle => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get topSellerReviewsTextStyle => TextStyle(
        fontSize: 12,
        color: AppColorScheme.haiti06,
      );

  @override
  TextStyle get haitiButtonTextStyle => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColorScheme.haiti,
      );

  TextStyle get productItemPriceNumberTextStyle => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get productItemPriceTextStyle => TextStyle(
        fontSize: 12,
        color: AppColorScheme.lilac,
      );

  @override
  TextStyle get productItemNameTextStyle => TextStyle(
        fontSize: 12,
      );

  @override
  TextStyle get productItemLocationTextStyle => TextStyle(
        fontSize: 10,
        color: AppColorScheme.haiti06,
      );

  @override
  TextStyle get profileAvatarLettersTextStyle => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColorScheme.vividTangerine,
      );

  @override
  TextStyle get profileNameTextStyle => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColorScheme.white,
      );

  @override
  TextStyle get profileReviewsTextStyle => TextStyle(
        fontSize: 12,
        color: AppColorScheme.white,
      );

  @override
  TextStyle get bottomSheetTitleTextStyle => TextStyle(fontSize: 17, fontWeight: FontWeight.w600);

  @override
  TextStyle get bottomSheetButtonTextStyle => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColorScheme.hollywoodCerise,
      );

  @override
  TextStyle get languageSelectBottomSheetLanguageSelectedTextStyle => TextStyle(
        fontSize: 18,
        color: AppColorScheme.hollywoodCerise,
      );

  @override
  TextStyle get wishlistsProductItemPriceNumberTextStyle => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColorScheme.haiti,
      );

  @override
  TextStyle get wishlistsProductItemNameTextStyle => TextStyle(
        fontSize: 14,
        color: AppColorScheme.haiti,
      );

  @override
  TextStyle get wishlistsProductItemPriceTextStyle => TextStyle(
        fontSize: 14,
        color: AppColorScheme.lilac,
      );

  @override
  TextStyle get browseItemLocationTextStyle => TextStyle(
        fontSize: 14,
        color: AppColorScheme.haiti06,
      );

  @override
  TextStyle get browseItemNameTextStyle => TextStyle(
        fontSize: 18,
        color: AppColorScheme.haiti,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get browseItemPriceNumberTextStyle => TextStyle(
        fontSize: 24,
        color: AppColorScheme.haiti,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get browseItemPriceTextStyle => TextStyle(
        fontSize: 24,
        color: AppColorScheme.haiti,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get itemDescriptionTitle => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColorScheme.haiti,
      );

  @override
  TextStyle get itemDescription => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColorScheme.haiti06,
      );

  @override
  TextStyle get browseItemRatingNumberTextStyle => TextStyle(
        fontSize: 12,
        color: AppColorScheme.haiti,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get browseItemRatingTextStyle => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColorScheme.haiti06,
      );

  @override
  TextStyle get browseItemLanguagesTextStyle => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColorScheme.haiti,
      );

  @override
  TextStyle get browseItemImageCountTextStyle => TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColorScheme.white,
      );

  TextStyle get languageSelectBottomSheetLanguageTextStyle => TextStyle(
        fontSize: 18,
        color: AppColorScheme.haiti06,
      );
}
