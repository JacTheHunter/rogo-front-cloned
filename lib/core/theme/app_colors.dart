import 'package:flutter/cupertino.dart';

abstract class AppColors {
  Color primaryColor();
  Color primaryTextColor();
  Color scaffoldBackgroundColor();
  Color onboardingIndicatorColor();
  Color onboardingIndicatorSelectedColor();
  Color checkboxColor();
  Color appBarBackgroundColor();
  Color appBarBackArrowColor();
  Color appBarBackArrowAlternativeColor();
  Color inputFillColor();
  Color appbarShadowColor();
  Color errorColor();

  Gradient createAccountHeaderGradient();
}
