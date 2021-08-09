import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:rogo/core/presentation/pages/widgets/app_image.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text_form_field.dart';
import 'package:rogo/core/presentation/pages/widgets/simple_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/theme/app_color_scheme.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';

class CreateAccountPage1 extends StatelessWidget {
  const CreateAccountPage1({Key? key}) : super(key: key);

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
              style: context.read<AppThemeCubit>().state.textTheme().createAccountTitleTextStyle(),
            ),
            SizedBox(height: 16),
            AppText(
              'authentication.createAccountPage.firstName',
              style: context.read<AppThemeCubit>().state.textTheme().inputLabelTextStyle(),
            ),
            AppTextFormField(initialValue: 'John'),
            SizedBox(height: 16),
            AppText(
              'authentication.createAccountPage.lastName',
              style: context.read<AppThemeCubit>().state.textTheme().inputLabelTextStyle(),
            ),
            AppTextFormField(initialValue: 'Doe'),
            SizedBox(height: 16),
            AppText(
              'authentication.createAccountPage.birthDate',
              style: context.read<AppThemeCubit>().state.textTheme().inputLabelTextStyle(),
            ),
            Container(
              decoration: BoxDecoration(
                  color: context.read<AppThemeCubit>().state.appColors().inputFillColor(),
                  borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 16),
              child: AppText(
                '08 june 1992',
                style: context.read<AppThemeCubit>().state.textTheme().inputTextStyle(),
              ),
            ),
            SizedBox(height: 40),
            AppText(
              'authentication.createAccountPage.phoneNumber',
              style: context.read<AppThemeCubit>().state.textTheme().inputGroupTitleTextStyle(),
            ),
            SizedBox(height: 8),
            AppText(
              'authentication.createAccountPage.countryRegion',
              style: context.read<AppThemeCubit>().state.textTheme().inputLabelTextStyle(),
            ),
            Container(
              decoration: BoxDecoration(
                  color: context.read<AppThemeCubit>().state.appColors().inputFillColor(),
                  borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 16),
              child: CountryCodePicker(
                onChanged: print,
                initialSelection: 'US',
                favorite: ['US', 'RU'],
                alignLeft: false,
                textStyle: context.read<AppThemeCubit>().state.textTheme().inputTextStyle(),
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
                        style: context.read<AppThemeCubit>().state.textTheme().inputTextStyle(),
                      ),
                      Spacer(),
                      context.read<AppThemeCubit>().state.appIcons().dropDownIcon(),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            AppText(
              'authentication.createAccountPage.phoneNumber',
              style: context.read<AppThemeCubit>().state.textTheme().inputLabelTextStyle(),
            ),
            AppTextFormField(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 0, left: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      '+1',
                      style: context.read<AppThemeCubit>().state.textTheme().inputTextStyle(),
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
            ),
            // Spacer(),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SimpleButton(
                  isWide: false,
                  child: Row(
                    children: [
                      AppText(
                        'authentication.createAccountPage.next',
                        style: context.read<AppThemeCubit>().state.textTheme().simpleButtonTextStyle(),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      context.read<AppThemeCubit>().state.appIcons().textButtonArrowRightIcon(),
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
