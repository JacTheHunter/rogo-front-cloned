import 'package:flutter/material.dart';

abstract class AppTextTheme {
  TextStyle onboardingTitleTextStyle();
  TextStyle onboardingTextStyle();
  TextStyle onboardingCrossedTextStyle();

  TextStyle textButtonTextStyle();
  TextStyle simpleButtonTextStyle();

  TextStyle authenticationTitleTextStyle();
  TextStyle authenticationSubTitleTextStyle();
  TextStyle authenticationTextStyle();
  TextStyle inputLabelTextStyle();
  TextStyle inputErrorTextStyle();
  TextStyle inputGroupTitleTextStyle();

  TextStyle privacyTextStyle();
  TextStyle privacyLinkTextStyle();

  TextStyle createAccountHeaderTitleTextStyle();
  TextStyle createAccountHeaderTextStyle();
  TextStyle createAccountHeaderBiggerNumberTextStyle();
  TextStyle createAccountTitleTextStyle();

  TextStyle inputTextStyle();
  TextStyle inputHintTextStyle();

  TextStyle confirmPhoneSubtitleTextStyle();
  TextStyle confirmPhoneSelectedNumberTextStyle();
  TextStyle confirmPhoneNumberPadTextStyle();
}
