import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../languages/domain/entities/language.dart';
import '../blocs/create_account_cubit/create_account_cubit.dart';

class LanguageWrapItem extends StatelessWidget {
  final bool isSelected;
  final Language language;
  const LanguageWrapItem(
    this.language, {
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<CreateAccountCubit>().updateLanguages(language.id),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: const EdgeInsets.only(right: 16, bottom: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? context.read<AppThemeCubit>().state.appColors.primaryColor : AppColorScheme.white,
            border: isSelected
                ? Border.all(width: 1, color: AppColorScheme.transparent)
                : Border.all(color: AppColorScheme.remi, width: 1)),
        child: AppText(
          language.name,
          color: isSelected ? AppColorScheme.white : context.read<AppThemeCubit>().state.appColors.primaryTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
