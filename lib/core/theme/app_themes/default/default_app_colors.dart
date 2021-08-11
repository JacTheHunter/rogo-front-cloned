import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rogo/core/theme/app_color_scheme.dart';
import 'package:rogo/core/theme/app_colors.dart';

class DefaultAppColors extends AppColors {
  @override
  Color primaryColor() {
    return AppColorScheme.hollywoodCerise;
  }

  @override
  Color scaffoldBackgroundColor() {
    return AppColorScheme.white;
  }

  @override
  Color primaryTextColor() {
    return AppColorScheme.haiti;
  }

  @override
  Color onboardingIndicatorColor() {
    return AppColorScheme.mystic;
  }

  @override
  Color onboardingIndicatorSelectedColor() {
    return AppColorScheme.hollywoodCerise;
  }

  @override
  Color checkboxColor() {
    return AppColorScheme.haiti;
  }

  @override
  Color appBarBackArrowAlternativeColor() {
    return AppColorScheme.white;
  }

  @override
  Color appBarBackArrowColor() {
    return AppColorScheme.black;
  }

  @override
  Color appBarBackgroundColor() {
    return AppColorScheme.transparent;
  }

  @override
  Gradient createAccountHeaderGradient() {
    return LinearGradient(
      colors: [
        AppColorScheme.gradient1_1,
        AppColorScheme.gradient1_2,
        AppColorScheme.gradient1_3,
      ],
      end: Alignment(0, -0.7),
      begin: Alignment(1, 1),
      stops: [0, 0.5307, 1],
    );
  }

  @override
  Color inputFillColor() {
    return AppColorScheme.remi;
  }

  @override
  Color appbarShadowColor() {
    return AppColorScheme.blueZodiac12;
  }

  @override
  Color errorColor() {
    return AppColorScheme.redOrange;
  }

  @override
  Color hintColor() {
    return AppColorScheme.regentGray;
  }

  @override
  Color sliverAppBarBackgroundColor() {
    return AppColorScheme.remi;
  }

  @override
  Color sliverAppBarSearchFillolor() {
    return AppColorScheme.white;
  }

  @override
  Color categoryItemBackgroundColor() {
    return AppColorScheme.wispPink;
  }

  @override
  Color productsBackgroundColor() {
    return AppColorScheme.whitePointer;
  }

  @override
  Color productItemBackgroundColor() {
    return AppColorScheme.white;
  }
}
