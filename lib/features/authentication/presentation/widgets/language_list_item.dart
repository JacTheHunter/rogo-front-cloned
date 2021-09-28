import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../languages/domain/entities/language.dart';
import '../blocs/create_account_cubit/create_account_cubit.dart';

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
                    ? context.appTextTheme.languageSelectBottomSheetLanguageSelectedTextStyle
                    : context.appTextTheme.languageSelectBottomSheetLanguageTextStyle,
              ),
              Theme(
                data: Theme.of(context).copyWith(unselectedWidgetColor: context.appColors.primaryColor),
                child: isSelected
                    ? context.appIcons.languageItemSelectedCheckboxIcon
                    : Container(
                        decoration: BoxDecoration(
                            color: context.appColors.inputFillColor, borderRadius: BorderRadius.circular(8)),
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
          color: context.appColors.inputFillColor,
        ),
      ],
    );
  }
}
