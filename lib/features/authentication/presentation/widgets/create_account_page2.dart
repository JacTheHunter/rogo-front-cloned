import 'package:flutter/material.dart';
import 'package:rogo/core/presentation/pages/widgets/app_dropdown.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/presentation/pages/widgets/simple_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';

class CreateAccountPage2 extends StatelessWidget {
  const CreateAccountPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'authentication.createAccountPage.specifyCountryAndCity',
            style: context.read<AppThemeCubit>().state.textTheme().createAccountTitleTextStyle(),
          ),
          SizedBox(height: 16),
          AppDropdown<String>(
            value: 'United States',
            onChanged: (String? val) {},
            items: [
              'United States',
              'Uzbekistan',
            ],
          ),
          SizedBox(height: 16),
          AppText(
            'authentication.createAccountPage.city',
            style: context.read<AppThemeCubit>().state.textTheme().inputLabelTextStyle(),
          ),
          AppDropdown<String>(
            value: 'San Diego',
            onChanged: (String? val) {},
            items: [
              'San Diego',
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  context.read<AppThemeCubit>().state.appIcons().textButtonArrowLeftIcon(),
                  SizedBox(
                    width: 8,
                  ),
                  AppText(
                    'authentication.createAccountPage.back',
                    style: context.read<AppThemeCubit>().state.textTheme().textButtonTextStyle(),
                  ),
                ],
              ),
              Spacer(),
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
                    context.read<AppThemeCubit>().state.appIcons().simpleButtonArrowRightIcon(),
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
    );
  }
}
