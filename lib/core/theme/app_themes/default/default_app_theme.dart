import 'package:rogo/core/theme/app_icons.dart';
import 'package:rogo/core/theme/app_text_theme.dart';
import 'package:rogo/core/theme/app_colors.dart';
import 'package:rogo/core/theme/app_theme.dart';
import 'package:rogo/core/theme/app_themes/default/default_app_colors.dart';
import 'package:rogo/core/theme/app_themes/default/default_app_icons.dart';
import 'package:rogo/core/theme/app_themes/default/default_app_text_theme.dart';

class DefaultAppTheme extends AppTheme {
  @override
  AppColors appColors() {
    return DefaultAppColors();
  }

  @override
  String fontFamily() {
    return 'SanFranciscoPro';
  }

  @override
  AppTextTheme textTheme() {
    return DefaultAppTextTheme();
  }

  @override
  AppIcons appIcons() {
    return DefaultAppIcons();
  }
}
