import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/theme/app_icons.dart';
import 'package:rogo/core/theme/app_text_theme.dart';

extension AppTheme on BuildContext {
  AppColors get appColors => this.read<AppThemeCubit>().state.appColors;
  AppTextTheme get appTextTheme => this.read<AppThemeCubit>().state.textTheme;
  AppIcons get appIcons => this.read<AppThemeCubit>().state.appIcons;
}
