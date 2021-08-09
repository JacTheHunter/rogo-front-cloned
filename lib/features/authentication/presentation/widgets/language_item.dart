import 'package:flutter/material.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/theme/app_color_scheme.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';

class LanguageItem extends StatelessWidget {
  final bool isSelected;
  final String text;
  const LanguageItem(
    this.text, {
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.only(right: 16, bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? context.read<AppThemeCubit>().state.appColors().primaryColor() : AppColorScheme.white,
          border: isSelected
              ? Border.all(width: 0, color: AppColorScheme.transparent)
              : Border.all(color: AppColorScheme.remi, width: 1)),
      child: AppText(
        text,
        color: isSelected ? AppColorScheme.white : context.read<AppThemeCubit>().state.appColors().primaryTextColor(),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
