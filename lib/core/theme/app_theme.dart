import 'package:rogo/core/theme/app_colors.dart';
import 'package:rogo/core/theme/app_icons.dart';

import 'app_text_theme.dart';

abstract class AppTheme {
  AppTextTheme get textTheme;
  AppColors get appColors;
  String get fontFamily;
  AppIcons get appIcons;
}
