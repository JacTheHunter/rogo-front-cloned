import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rogo/core/theme/app_text_theme.dart';
import 'package:rogo/core/theme/app_theme.dart';
import 'package:rogo/core/theme/app_themes/default/default_app_theme.dart';

class AppThemeCubit extends Cubit<AppTheme> {
  AppThemeCubit() : super(DefaultAppTheme());
}
