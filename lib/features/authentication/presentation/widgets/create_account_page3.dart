import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../core/presentation/pages/widgets/app_loader.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/presentation/pages/widgets/simple_button.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../languages/presentation/blocs/languages_cubit/languages_cubit.dart';
import '../blocs/create_account_cubit/create_account_cubit.dart';
import 'add_languages_button.dart';
import 'language_wrap_item.dart';
import 'languages_sheet.dart';

class CreateAccountPage3 extends StatelessWidget {
  final CreateAccountState state;
  const CreateAccountPage3({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<LanguagesCubit, LanguagesState>(
        builder: (context, lstate) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'authentication.createAccountPage.whatLanguages',
                style: context.appTextTheme.createAccountTitleTextStyle,
              ),
              SizedBox(height: 16),
              Wrap(
                children: lstate.topLanguages
                    .map((tl) => LanguageWrapItem(
                          tl,
                          isSelected: lstate.selectedLanguages.contains(tl),
                        ))
                    .toList(),
              ),
              // SizedBox(height: 16),
              AddLanguagesButton(
                onTap: () => onAddLanguageButton(context),
              ),
              if (state.languages.invalid) ...[
                SizedBox(height: 10),
                AppText(
                  'validators.languages',
                  style: context.appTextTheme.inputErrorTextStyle,
                ),
              ],
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => context.read<CreateAccountCubit>().onBack(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        context.appIcons.textButtonArrowLeftIcon,
                        SizedBox(
                          width: 8,
                        ),
                        AppText(
                          'authentication.createAccountPage.back',
                          style: context.appTextTheme.textButtonTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  state.status == FormzStatus.submissionInProgress
                      ? SimpleButton(
                          isWide: false,
                          child: Center(child: AppLoader(reverse: true)),
                        )
                      : SimpleButton(
                          onTap: () => context.read<CreateAccountCubit>().onNext(),
                          isWide: false,
                          child: Row(
                            children: [
                              AppText(
                                'authentication.createAccountPage.next',
                                style: context.appTextTheme.simpleButtonTextStyle,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              context.appIcons.textButtonArrowRightIcon,
                            ],
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
        },
      ),
    );
  }

  void onAddLanguageButton(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColorScheme.transparent,
      context: context,
      builder: (context) => LanguagesSheet(),
    );
  }
}
