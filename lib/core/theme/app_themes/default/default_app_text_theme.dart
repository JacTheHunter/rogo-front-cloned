import 'package:flutter/material.dart';
import 'package:rogo/core/theme/app_color_scheme.dart';
import 'package:rogo/core/theme/app_text_theme.dart';

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
}
