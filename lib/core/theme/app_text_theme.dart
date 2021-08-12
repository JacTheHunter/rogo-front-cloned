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

  TextStyle searchInputHintTextStyle();

  TextStyle confirmPhoneSubtitleTextStyle();
  TextStyle confirmPhoneSelectedNumberTextStyle();
  TextStyle confirmPhoneNumberPadTextStyle();

  TextStyle sliverHeaderTitleTextStyle();

  TextStyle tabBarSelectedLabelTextStyle();
  TextStyle tabBarUnSelectedLabelTextStyle();

  TextStyle browseTitleTextStyle();
  TextStyle browseCategoryTextStyle();

  TextStyle topSellerNameTextStyle();
  TextStyle topSellerRatingTextStyle();
  TextStyle topSellerReviewsTextStyle();

  TextStyle productItemPriceNumberTextStyle();
  TextStyle productItemPriceTextStyle();
  TextStyle productItemNameTextStyle();
  TextStyle productItemLocationTextStyle();

  TextStyle profileAvatarLettersTextStyle();
  TextStyle profileNameTextStyle();
  TextStyle profileReviewsTextStyle();
}
