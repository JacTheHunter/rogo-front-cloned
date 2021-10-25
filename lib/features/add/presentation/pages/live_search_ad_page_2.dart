import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_dropdown.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/presentation/pages/widgets/app_text_form_field.dart';
import '../../../../core/presentation/pages/widgets/simple_button.dart';
import '../../../countries_and_cities/domain/entities/city.dart';
import '../../../countries_and_cities/domain/entities/country.dart';
import '../../../countries_and_cities/presentation/blocs/countries_and_cities_cubit/countries_and_cities_cubit.dart';
import '../bloc/add_publication_cubit/add_publication_cubit.dart';

class LiveSearchNewAdPage2 extends StatelessWidget {
  LiveSearchNewAdPage2({Key? key}) : super(key: key);
  // File? source;
  // Future setPicture() async {
  //   final XFile? takenImage = await ImagePicker().pickImage(source: ImageSource.camera);
  //   source = File(takenImage!.path);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPublicationCubit, AddPublicationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'add.liveSearchNewAdPage2.createNewAd',
                style: context.read<AppThemeCubit>().state.textTheme.addPublicationHeaderTextStyle,
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: AppText(
                  'add.liveSearchNewAdPage2.country',
                  style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                ),
              ),
              AppDropdown<Country>(
                value: state.selectedCountry,
                onChanged: context.read<AddPublicationCubit>().updateCountry,
                items: context.read<CountriesAndCitiesCubit>().state.countries,
              ),
              if (state.country.invalid)
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: AppText(
                    'validators.thisFieldIsRequired',
                    style: context.read<AppThemeCubit>().state.textTheme.inputErrorTextStyle,
                  ),
                ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: AppText(
                  'add.createNewAdPage2.city',
                  style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                ),
              ),
              BlocBuilder<CountriesAndCitiesCubit, CountriesAndCitiesState>(
                buildWhen: (previous, current) => previous.cities != current.cities,
                builder: (context, cstate) {
                  return AppDropdown<City>(
                    value: state.selectedCity,
                    onChanged: context.read<AddPublicationCubit>().updateCity,
                    items: context.read<CountriesAndCitiesCubit>().state.cities,
                  );
                },
              ),
              if (state.city.invalid)
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: AppText(
                    'validators.thisFieldIsRequired',
                    style: context.read<AppThemeCubit>().state.textTheme.inputErrorTextStyle,
                  ),
                ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: AppText(
                  'add.createNewAdPage2.zip',
                  style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                ),
              ),
              AppTextFormField(
                initialValue: state.zip.value,
                onChanged: context.read<AddPublicationCubit>().updateZip,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              if (state.zip.invalid)
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: AppText(
                    'validators.thisFieldIsRequired',
                    style: context.read<AppThemeCubit>().state.textTheme.inputErrorTextStyle,
                  ),
                ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SimpleButton(
                  onTap: () {
                    context.read<AddPublicationCubit>().incrementStep();
                  },
                  text: 'add.liveSearchNewAdPage2.nextStep',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
