import 'package:flutter/material.dart';

import '../../app_color_scheme.dart';
import '../../app_text_theme.dart';

class DefaultAppTextTheme extends AppTextTheme {
  @override
  TextStyle onboardingTitleTextStyle() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 36,
    );
  }

  @override
  TextStyle onboardingTextStyle() {
    return TextStyle(
      fontSize: 16,
      color: AppColorScheme.manatee,
    );
  }

  @override
  TextStyle onboardingCrossedTextStyle() {
    return onboardingTextStyle()..copyWith(decoration: TextDecoration.lineThrough);
  }

  @override
  TextStyle textButtonTextStyle() {
    return TextStyle(
      color: AppColorScheme.hollywoodCerise,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
  }

  @override
  TextStyle authenticationTitleTextStyle() {
    return TextStyle(fontSize: 36);
  }

  @override
  TextStyle inputLabelTextStyle() {
    return TextStyle(
      fontSize: 14,
      color: AppColorScheme.regentGray,
    );
  }

  @override
  TextStyle inputErrorTextStyle() {
    return TextStyle(
      fontSize: 12,
      color: AppColorScheme.pomegranate,
    );
  }

  @override
  TextStyle simpleButtonTextStyle() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColorScheme.white,
    );
  }

  @override
  TextStyle authenticationSubTitleTextStyle() {
    return TextStyle(
      fontSize: 14,
      color: AppColorScheme.regentGray,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  TextStyle authenticationTextStyle() {
    return TextStyle(
      color: AppColorScheme.pickledBluewood,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  TextStyle privacyLinkTextStyle() {
    return privacyTextStyle().copyWith(
      color: AppColorScheme.hollywoodCerise,
    );
  }

  @override
  TextStyle privacyTextStyle() {
    return TextStyle(
      color: AppColorScheme.pickledBluewood,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  TextStyle createAccountHeaderTitleTextStyle() {
    return TextStyle(
      color: AppColorScheme.white,
      fontSize: 28,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  TextStyle createAccountTitleTextStyle() {
    return TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  TextStyle createAccountHeaderBiggerNumberTextStyle() {
    return TextStyle(
      color: AppColorScheme.frenchLilac,
      fontSize: 24,
    );
  }

  @override
  TextStyle createAccountHeaderTextStyle() {
    return TextStyle(
      color: AppColorScheme.frenchLilac,
      fontSize: 16,
    );
  }

  @override
  TextStyle inputTextStyle() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColorScheme.ebonyClay,
    );
  }

  @override
  TextStyle inputHintTextStyle() {
    return TextStyle(
      fontSize: 14,
      color: AppColorScheme.regentGray,
    );
  }

  @override
  TextStyle searchInputHintTextStyle() {
    return TextStyle(
      fontSize: 14,
      color: AppColorScheme.lilac,
    );
  }

  @override
  TextStyle inputGroupTitleTextStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColorScheme.haiti,
    );
  }

  @override
  TextStyle confirmPhoneSubtitleTextStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColorScheme.regentGray,
    );
  }

  @override
  TextStyle confirmPhoneSelectedNumberTextStyle() {
    return TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w500,
      color: AppColorScheme.white,
    );
  }

  @override
  TextStyle confirmPhoneNumberPadTextStyle() {
    return TextStyle(
      fontSize: 36,
      color: AppColorScheme.black,
    );
  }

  @override
  TextStyle sliverHeaderTitleTextStyle() {
    return TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
    );
  }

  @override
  TextStyle tabBarSelectedLabelTextStyle() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
  }

  @override
  TextStyle tabBarUnSelectedLabelTextStyle() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColorScheme.lilac,
    );
  }

  @override
  TextStyle browseTitleTextStyle() {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }

  @override
  TextStyle browseCategoryTextStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  @override
  TextStyle topSellerNameTextStyle() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  @override
  TextStyle topSellerRatingTextStyle() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
  }

  @override
  TextStyle topSellerReviewsTextStyle() {
    return TextStyle(
      fontSize: 12,
      color: AppColorScheme.haiti06,
    );
  }

  @override
  TextStyle productItemPriceNumberTextStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  @override
  TextStyle productItemPriceTextStyle() {
    return TextStyle(
      fontSize: 12,
      color: AppColorScheme.lilac,
    );
  }

  @override
  TextStyle productItemNameTextStyle() {
    return TextStyle(
      fontSize: 12,
    );
  }

  @override
  TextStyle productItemLocationTextStyle() {
    return TextStyle(
      fontSize: 10,
      color: AppColorScheme.haiti06,
    );
  }

  @override
  TextStyle profileAvatarLettersTextStyle() {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.vividTangerine,
    );
  }

  @override
  TextStyle profileNameTextStyle() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.white,
    );
  }

  @override
  TextStyle profileReviewsTextStyle() {
    return TextStyle(
      fontSize: 12,
      color: AppColorScheme.white,
    );
  }
}
