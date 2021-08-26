import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rogo/core/presentation/pages/widgets/app_dropdown.dart';
import 'package:rogo/core/presentation/pages/widgets/app_loader.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text_form_field.dart';
import 'package:rogo/core/presentation/pages/widgets/simple_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/features/authentication/presentation/blocs/create_account_cubit/create_account_cubit.dart';
import 'package:rogo/features/countries_and_cities/domain/entities/city.dart';
import 'package:rogo/features/countries_and_cities/domain/entities/country.dart';
import 'package:rogo/features/countries_and_cities/presentation/blocs/countries_and_cities_cubit/countries_and_cities_cubit.dart';

class CreateAccountPage2 extends StatelessWidget {
  final CreateAccountState state;
  const CreateAccountPage2({Key? key, required this.state}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<CountriesAndCitiesCubit, CountriesAndCitiesState>(
        builder: (context, cState) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'authentication.createAccountPage.specifyCountryAndCity',
                  style: context.read<AppThemeCubit>().state.textTheme.createAccountTitleTextStyle,
                ),
                SizedBox(height: 16),
                AppText(
                  'authentication.createAccountPage.country',
                  style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                ),
                AppDropdown<Country>(
                  value: cState.selectedCountry != Country(id: -1, name: '') ? cState.selectedCountry : null,
                  onChanged: context.read<CreateAccountCubit>().updateCountry,
                  items: cState.countries,
                ),
                if (state.country.invalid)
                  AppText(
                    'validators.thisFieldIsRequired',
                    style: context.read<AppThemeCubit>().state.textTheme.inputErrorTextStyle,
                  ),
                SizedBox(height: 16),
                AppText(
                  'authentication.createAccountPage.city',
                  style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                ),
                cState.isLoading
                    ? AppLoader()
                    : AppDropdown<City>(
                        value: cState.selectedCity != City(id: -1, name: '') ? cState.selectedCity : null,
                        onChanged: context.read<CreateAccountCubit>().updateCity,
                        items: cState.cities,
                      ),
                if (state.city.invalid)
                  AppText(
                    'validators.thisFieldIsRequired',
                    style: context.read<AppThemeCubit>().state.textTheme.inputErrorTextStyle,
                  ),
                SizedBox(height: 16),
                AppText(
                  'authentication.createAccountPage.zip',
                  style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                ),
                AppTextFormField(
                  initialValue: context.read<CreateAccountCubit>().state.zip.value,
                  onChanged: context.read<CreateAccountCubit>().updateZip,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                ),
                if (state.zip.invalid)
                  AppText(
                    'validators.thisFieldIsRequired',
                    style: context.read<AppThemeCubit>().state.textTheme.inputErrorTextStyle,
                  ),
                SizedBox(height: 40),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => context.read<CreateAccountCubit>().onBack(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          context.read<AppThemeCubit>().state.appIcons.textButtonArrowLeftIcon,
                          SizedBox(
                            width: 8,
                          ),
                          AppText(
                            'authentication.createAccountPage.back',
                            style: context.read<AppThemeCubit>().state.textTheme.textButtonTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    SimpleButton(
                      onTap: () => context.read<CreateAccountCubit>().onNext(),
                      isWide: false,
                      child: Row(
                        children: [
                          AppText(
                            'authentication.createAccountPage.next',
                            style: context.read<AppThemeCubit>().state.textTheme.simpleButtonTextStyle,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          context.read<AppThemeCubit>().state.appIcons.simpleButtonArrowRightIcon,
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
        },
      ),
    );
  }
}
