import 'package:rogo/core/theme/app_colors.dart';
import 'package:rogo/core/theme/app_icons.dart';

import 'app_text_theme.dart';

abstract class AppTheme {
  AppTextTheme textTheme();
  AppColors appColors();
  String fontFamily();
  AppIcons appIcons();
}
