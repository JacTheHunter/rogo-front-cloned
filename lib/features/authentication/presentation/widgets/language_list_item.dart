import 'package:flutter/material.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/features/authentication/presentation/blocs/create_account_cubit/create_account_cubit.dart';
import 'package:rogo/features/languages/domain/entities/language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageListItem extends StatelessWidget {
  final bool isSelected;
  final Language language;
  const LanguageListItem(
    this.language, {
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        GestureDetector(
          onTap: () => context.read<CreateAccountCubit>().updateLanguages(language.id),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                language.name,
                style: isSelected
                    ? context.read<AppThemeCubit>().state.textTheme.languageSelectBottomSheetLanguageSelectedTextStyle
                    : context.read<AppThemeCubit>().state.textTheme.languageSelectBottomSheetLanguageTextStyle,
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(unselectedWidgetColor: context.read<AppThemeCubit>().state.appColors.primaryColor),
                child: isSelected
                    ? context.read<AppThemeCubit>().state.appIcons.languageItemSelectedCheckboxIcon
                    : Container(
                        decoration: BoxDecoration(
                            color: context.read<AppThemeCubit>().state.appColors.inputFillColor,
                            borderRadius: BorderRadius.circular(8)),
                        width: 28,
                        height: 28,
                      ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 1,
          width: double.infinity,
          color: context.read<AppThemeCubit>().state.appColors.inputFillColor,
        ),
      ],
    );
  }
}
