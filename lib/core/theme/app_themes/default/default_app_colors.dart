import 'dart:ui';

import 'package:flutter/material.dart';

import '../../app_color_scheme.dart';
import '../../app_colors.dart';

class DefaultAppColors extends AppColors {
  @override
  Color get primaryColor => AppColorScheme.hollywoodCerise;

  @override
  Color get scaffoldBackgroundColor => AppColorScheme.white;

  @override
  Color get primaryTextColor => AppColorScheme.haiti;

  @override
  Color get onboardingIndicatorColor => AppColorScheme.mystic;

  @override
  Color get onboardingIndicatorSelectedColor => AppColorScheme.hollywoodCerise;

  @override
  Color get checkboxColor => AppColorScheme.haiti;

  @override
  Color get appBarBackArrowAlternativeColor => AppColorScheme.white;

  @override
  Color get appBarBackArrowColor => AppColorScheme.black;

  @override
  Color get appBarBackgroundColor => AppColorScheme.transparent;

  @override
  Gradient get createAccountHeaderGradient => LinearGradient(
        colors: [
          AppColorScheme.gradient1_1,
          AppColorScheme.gradient1_2,
          AppColorScheme.gradient1_3,
        ],
        end: Alignment(0, -0.7),
        begin: Alignment(1, 1),
        stops: [0, 0.5307, 1],
      );

  @override
  Color get inputFillColor => AppColorScheme.remi;

  @override
  Color get appbarShadowColor => AppColorScheme.blueZodiac12;

  @override
  Color get errorColor => AppColorScheme.redOrange;

  @override
  Color get hintColor => AppColorScheme.regentGray;

  @override
  Color get sliverAppBarBackgroundColor => AppColorScheme.remi;

  @override
  Color get sliverAppBarSearchFillolor => AppColorScheme.white;

  @override
  Color get categoryItemBackgroundColor => AppColorScheme.wispPink;

  @override
  Color get productsBackgroundColor => AppColorScheme.whitePointer;

  @override
  Color get productItemBackgroundColor => AppColorScheme.white;

  @override
  Color get profileAvatarBackgroundColor => AppColorScheme.forgetMeNot;

  @override
  Color get sliverWishlistsAppBarBackgroundColor => AppColorScheme.whitePointer;

  @override
  Color get inboxChatRoomItemBackgroundColor => AppColorScheme.white;

  @override
  Color get inboxChatRoomItemBorderColor => AppColorScheme.hollywoodCerise;

  @override
  Color get inboxChatRoomBackgroundColor => AppColorScheme.whitePointer;

  @override
  Color get inboxChatRoomItemNewMessagesBackgroundColor => AppColorScheme.hollywoodCerise;

  @override
  Color get chatBackgroundColor => AppColorScheme.whitePointer;

  @override
  Color get chatInputsBackgroundColor => AppColorScheme.white;

  @override
  Color get chatInputsBorderColor => AppColorScheme.remi;

  @override
  Color get chatOwnMessageBackgroundColor => AppColorScheme.pinkLace;

  @override
  Color get chatPartnerMessageBackgroundColor => AppColorScheme.white;

  @override
  Color get chatInputsSendButtonBackgroundColor => AppColorScheme.hollywoodCerise;

  @override
  Color get chatAvatarBackgroundColor => AppColorScheme.chablis;
}
