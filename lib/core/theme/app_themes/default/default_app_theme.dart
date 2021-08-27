import '../../app_colors.dart';
import '../../app_icons.dart';
import '../../app_text_theme.dart';
import '../../app_theme.dart';
import 'default_app_colors.dart';
import 'default_app_icons.dart';
import 'default_app_text_theme.dart';

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
