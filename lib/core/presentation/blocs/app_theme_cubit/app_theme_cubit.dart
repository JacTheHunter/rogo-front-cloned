import 'package:bloc/bloc.dart';
import 'package:rogo/core/theme/app_theme.dart';
import 'package:rogo/core/theme/app_themes/default/default_app_theme.dart';

class AppThemeCubit extends Cubit<AppTheme> {
  AppThemeCubit() : super(DefaultAppTheme());
}
