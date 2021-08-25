import 'package:rogo/core/theme/app_icons.dart';
import 'package:rogo/core/theme/app_text_theme.dart';
import 'package:rogo/core/theme/app_colors.dart';
import 'package:rogo/core/theme/app_theme.dart';
import 'package:rogo/core/theme/app_themes/default/default_app_colors.dart';
import 'package:rogo/core/theme/app_themes/default/default_app_icons.dart';
import 'package:rogo/core/theme/app_themes/default/default_app_text_theme.dart';

class DefaultAppTheme extends AppTheme {
  @override
  AppColors get appColors => DefaultAppColors();

  @override
  String get fontFamily => 'SanFranciscoPro';

  @override
  AppTextTheme get textTheme => DefaultAppTextTheme();

  @override
  AppIcons get appIcons => DefaultAppIcons();
}
