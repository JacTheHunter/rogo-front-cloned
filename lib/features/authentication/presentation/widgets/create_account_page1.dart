import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:formz/formz.dart';

import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../core/presentation/pages/widgets/app_image.dart';
import '../../../../core/presentation/pages/widgets/app_loader.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/presentation/pages/widgets/app_text_form_field.dart';
import '../../../../core/presentation/pages/widgets/simple_button.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../blocs/create_account_cubit/create_account_cubit.dart';

class CreateAccountPage1 extends StatelessWidget {
  final CreateAccountState state;
  const CreateAccountPage1({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'authentication.createAccountPage.enterNameDateOfBirthAndPhoneNumber',
              style: context.appTextTheme.createAccountTitleTextStyle,
            ),
            SizedBox(height: 16),
            AppText(
              'authentication.createAccountPage.firstName',
              style: context.appTextTheme.inputLabelTextStyle,
            ),
            AppTextFormField(
              initialValue: context.read<CreateAccountCubit>().state.firstName.value,
              onChanged: context.read<CreateAccountCubit>().updateFirstName,
              textCapitalization: TextCapitalization.words,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ],
            ),
            if (state.firstName.invalid)
              AppText(
                'validators.thisFieldIsRequired',
                style: context.appTextTheme.inputErrorTextStyle,
              ),
            SizedBox(height: 16),
            AppText(
              'authentication.createAccountPage.lastName',
              style: context.appTextTheme.inputLabelTextStyle,
            ),
            AppTextFormField(
              initialValue: context.read<CreateAccountCubit>().state.lastName.value,
              onChanged: context.read<CreateAccountCubit>().updateLastName,
              textCapitalization: TextCapitalization.words,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ],
            ),
            if (state.lastName.invalid)
              AppText(
                'validators.thisFieldIsRequired',
                style: context.appTextTheme.inputErrorTextStyle,
              ),
            SizedBox(height: 16),
            AppText(
              'authentication.createAccountPage.birthDate',
              style: context.appTextTheme.inputLabelTextStyle,
            ),
            GestureDetector(
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(1900, 1, 1),
                  maxTime: DateTime.now(),
                  onChanged: (date) {
                    print('change $date');
                  },
                  onConfirm: context.read<CreateAccountCubit>().updateBirthDate,
                  currentTime: DateTime.now(),
                );
              },
              child: Container(
                decoration:
                    BoxDecoration(color: context.appColors.inputFillColor, borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 16),
                child: AppText(
                  state.birthDate.value,
                  style: context.appTextTheme.inputTextStyle,
                ),
              ),
            ),
            if (state.lastName.invalid)
              AppText(
                'validators.thisFieldIsRequired',
                style: context.appTextTheme.inputErrorTextStyle,
              ),

            SizedBox(height: 40),
            AppText(
              'authentication.createAccountPage.phoneNumber',
              style: context.appTextTheme.inputGroupTitleTextStyle,
            ),
            SizedBox(height: 8),
            AppText(
              'authentication.createAccountPage.countryRegion',
              style: context.appTextTheme.inputLabelTextStyle,
            ),
            Container(
              decoration:
                  BoxDecoration(color: context.appColors.inputFillColor, borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 16),
              child: CountryCodePicker(
                onChanged: context.read<CreateAccountCubit>().updatePhoneCountryCode,
                initialSelection: 'UZ',
                favorite: ['UZ', 'US', 'RU'],
                alignLeft: false,
                textStyle: context.appTextTheme.inputTextStyle,
                builder: (CountryCode? code) {
                  return Row(
                    children: [
                      AppImage.asset(
                        code?.flagUri ?? '',
                        package: 'country_code_picker',
                        width: 32,
                      ),
                      SizedBox(width: 10),
                      AppText(
                        code?.name ?? '',
                        style: context.appTextTheme.inputTextStyle,
                      ),
                      Spacer(),
                      context.appIcons.dropDownIcon,
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            AppText(
              'authentication.createAccountPage.phoneNumber',
              style: context.appTextTheme.inputLabelTextStyle,
            ),
            AppTextFormField(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 0, left: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      state.phoneCountryCode,
                      style: context.appTextTheme.inputTextStyle,
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 1,
                      color: AppColorScheme.regentGray,
                      height: 26,
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              ),
              hintText: 'authentication.createAccountPage.yourPhoneNumber',
              initialValue: context.read<CreateAccountCubit>().state.phoneNumber.value,
              onChanged: context.read<CreateAccountCubit>().updatePhoneNumber,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
            ),
            // Spacer(),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
        ),
      ),
    );
  }
}
