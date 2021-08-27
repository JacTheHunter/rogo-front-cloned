import 'package:bloc/bloc.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';

import '../../../../../core/configs/constants/app_routes.dart';
import '../../../../../core/form_models/birth_date_form_model.dart';
import '../../../../../core/form_models/city_form_model.dart';
import '../../../../../core/form_models/country_form_model.dart';
import '../../../../../core/form_models/first_name_form_model.dart';
import '../../../../../core/form_models/languages_form_model.dart';
import '../../../../../core/form_models/last_name_form_model.dart';
import '../../../../../core/form_models/phone_number_form_model.dart';
import '../../../../../core/form_models/zip_form_model.dart';
import '../../../../../core/injection/injection_container.dart';
import '../../../../../core/services/navigation_service.dart';
import '../../../../countries_and_cities/domain/entities/city.dart';
import '../../../../countries_and_cities/domain/entities/country.dart';
import '../../../../countries_and_cities/presentation/blocs/countries_and_cities_cubit/countries_and_cities_cubit.dart';
import '../../../../languages/presentation/blocs/languages_cubit/languages_cubit.dart';
import '../../../domain/usecases/register_user_usecase.dart' as register;
import '../../../domain/usecases/verify_phone_number_in_firebase_usecase.dart' as verify;
import '../authentication_cubit/authentication_cubit.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final AuthenticationCubit _authenticationCubit;
  final register.RegisterUserUseCase _registerUserUseCase;
  final verify.VerifyPhoneNumberInFirebaseUseCase _verifyPhoneNumberInFirebaseUseCase;
  final CountriesAndCitiesCubit _countriesAndCitiesCubit;
  final LanguagesCubit _languagesCubit;
  CreateAccountCubit({
    required verify.VerifyPhoneNumberInFirebaseUseCase verifyPhoneNumberInFirebaseUseCase,
    required register.RegisterUserUseCase registerUserUseCase,
    required CountriesAndCitiesCubit countriesAndCitiesCubit,
    required AuthenticationCubit authenticationCubit,
    required LanguagesCubit languagesCubit,
  })  : _verifyPhoneNumberInFirebaseUseCase = verifyPhoneNumberInFirebaseUseCase,
        _registerUserUseCase = registerUserUseCase,
        _countriesAndCitiesCubit = countriesAndCitiesCubit,
        _languagesCubit = languagesCubit,
        _authenticationCubit = authenticationCubit,
        super(CreateAccountState());

  void updateFirstName(String firstName) {
    final fn = FirstNameFormModel.dirty(firstName);
    emit(
      state.copyWith(
        firstName: fn.valid ? fn : FirstNameFormModel.pure(firstName),
        status: Formz.validate(
          [
            fn,
            state.lastName,
            state.birthDate,
            state.phoneNumber,
            state.country,
            state.city,
            state.zip,
            state.languages
          ],
        ),
      ),
    );
  }

  void updateLastName(String lastName) {
    final ln = LastNameFormModel.dirty(lastName);
    emit(
      state.copyWith(
        lastName: ln.valid ? ln : LastNameFormModel.pure(lastName),
        status: Formz.validate(
          [
            ln,
            state.firstName,
            state.birthDate,
            state.phoneNumber,
            state.country,
            state.city,
            state.zip,
            state.languages
          ],
        ),
      ),
    );
  }

  void updateBirthDate(DateTime birthDate) {
    final bd = BirthDateFormModel.dirty(birthDate.toIso8601String().substring(0, 10));
    emit(
      state.copyWith(
        birthDate: bd.valid ? bd : BirthDateFormModel.pure(birthDate.toString()),
        status: Formz.validate(
          [
            bd,
            state.firstName,
            state.lastName,
            state.phoneNumber,
            state.country,
            state.city,
            state.zip,
            state.languages
          ],
        ),
      ),
    );
  }

  void updatePhoneNumber(String phoneNumber) {
    final pn = PhoneNumberFormModel.dirty(phoneNumber);
    emit(
      state.copyWith(
        phoneNumber: pn.valid ? pn : PhoneNumberFormModel.pure(phoneNumber),
        status: Formz.validate(
          [
            pn,
            state.firstName,
            state.lastName,
            state.birthDate,
            state.country,
            state.city,
            state.zip,
            state.languages,
          ],
        ),
      ),
    );
  }

  void updatePhoneCountryCode(CountryCode phoneCountryCode) {
    emit(
      state.copyWith(
        phoneNumber: state.phoneNumber,
        status: Formz.validate(
          [
            state.phoneNumber,
            state.firstName,
            state.lastName,
            state.birthDate,
            state.country,
            state.city,
            state.zip,
            state.languages,
          ],
        ),
        phoneCountryCode: phoneCountryCode.dialCode,
      ),
    );
  }

  void updateCountry(Country? country) {
    if (country != null) {
      _countriesAndCitiesCubit.selectCountry(country.id);
      final co = CountryFormModel.dirty(country.id);
      emit(
        state.copyWith(
          country: co.valid ? co : CountryFormModel.pure(country.id),
          status: Formz.validate(
            [
              co,
              state.firstName,
              state.lastName,
              state.birthDate,
              state.phoneNumber,
              state.city,
              state.zip,
              state.languages,
            ],
          ),
        ),
      );
    }
  }

  void updateCity(City? city) {
    if (city != null) {
      _countriesAndCitiesCubit.selectCity(city.id);
      final ci = CityFormModel.dirty(city.id);
      emit(
        state.copyWith(
          city: ci.valid ? ci : CityFormModel.pure(city.id),
          status: Formz.validate(
            [
              ci,
              state.firstName,
              state.lastName,
              state.birthDate,
              state.phoneNumber,
              state.country,
              state.zip,
              state.languages,
            ],
          ),
        ),
      );
    }
  }

  void updateZip(String zip) {
    final zi = ZipFormModel.dirty(zip);
    emit(
      state.copyWith(
        zip: zi.valid ? zi : ZipFormModel.pure(zip),
        status: Formz.validate(
          [
            zi,
            state.firstName,
            state.lastName,
            state.birthDate,
            state.phoneNumber,
            state.country,
            state.city,
            state.languages,
          ],
        ),
      ),
    );
  }

  void updateLanguages(int languageId) {
    List<int> newLanguagesList = List.from(state.languages.value);

    if (state.languages.value.any((l) => l == languageId)) {
      newLanguagesList.remove(languageId);
    } else {
      newLanguagesList.add(languageId);
    }

    _languagesCubit.selectUnselectLanguage(languageId);

    final zi = LanguagesFormModel.dirty(newLanguagesList);
    emit(
      state.copyWith(
        languages: zi.valid ? zi : LanguagesFormModel.pure(newLanguagesList),
        status: Formz.validate(
          [
            zi,
            state.firstName,
            state.lastName,
            state.birthDate,
            state.phoneNumber,
            state.country,
            state.city,
            state.zip,
          ],
        ),
      ),
    );
  }

  void finishPhoneConfirm() {
    emit(state.copyWith(step: state.step + 1, isPhoneConfirmed: true));
  }

  void onBack() {
    emit(state.copyWith(step: state.step - 1));
  }

  void onNext({bool withRedirect = true}) async {
    if (state.step == 1) {
      final fn = FirstNameFormModel.dirty(state.firstName.value);
      final ln = LastNameFormModel.dirty(state.lastName.value);
      final bd = BirthDateFormModel.dirty(state.birthDate.value);
      final pn = PhoneNumberFormModel.dirty(state.phoneNumber.value);

      emit(
        state.copyWith(
          status: Formz.validate(
            [
              fn,
              ln,
              bd,
              pn,
            ],
          ),
          firstName: fn,
          lastName: ln,
          birthDate: bd,
          phoneNumber: pn,
        ),
      );

      if (state.status.isValidated) {
        if (state.isPhoneConfirmed) {
          emit(state.copyWith(step: state.step + 1));
        } else {
          emit(state.copyWith(status: FormzStatus.submissionInProgress));
          final verifyResult = await _verifyPhoneNumberInFirebaseUseCase.call(
            verify.Params(
                phoneNumber: state.phoneCountryCode + pn.value,
                verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
                  print(phoneAuthCredential.signInMethod);
                  emit(state.copyWith(step: 2));
                },
                codeSent: (String verificationId, int? forceResendingToken) {
                  emit(state.copyWith(
                    verificationId: verificationId,
                    forceResendingToken: forceResendingToken,
                    status: FormzStatus.valid,
                  ));
                  if (withRedirect) sl<NavigatorService>().pushNamed(AppRoutes.confirmPhoneNumberPage);
                },
                verificationFailed: (error) {
                  emit(state.copyWith(status: FormzStatus.submissionFailure, errorMessage: error.message));
                }),
          );
          verifyResult.fold((l) {
            emit(state.copyWith(status: FormzStatus.submissionFailure, errorMessage: l.message));
          }, (r) {});
        }
      }
      return;
    }
    if (state.step == 2) {
      final co = CountryFormModel.dirty(state.country.value);
      final ci = CityFormModel.dirty(state.city.value);
      final zi = ZipFormModel.dirty(state.zip.value);

      emit(
        state.copyWith(
          status: Formz.validate(
            [
              co,
              ci,
              zi,
            ],
          ),
          country: co,
          city: ci,
          zip: zi,
        ),
      );

      if (state.status.isValidated) {
        emit(state.copyWith(step: state.step + 1));
      }
      return;
    }
    if (state.step == 3) {
      final la = LanguagesFormModel.dirty(state.languages.value);

      emit(
        state.copyWith(
          status: Formz.validate(
            [
              la,
            ],
          ),
          languages: la,
        ),
      );

      if (state.status.isValidated) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        String speaks = '';
        for (var i = 0; i < state.languages.value.length; i++) {
          speaks += state.languages.value[i].toString();
          if (i != state.languages.value.length - 1) {
            speaks += ', ';
          }
        }

        final result = await _registerUserUseCase.call(register.Params(
          firstName: state.firstName.value,
          lastName: state.lastName.value,
          birtDate: state.birthDate.value,
          phone: state.phoneCountryCode + state.phoneNumber.value,
          country: state.country.value,
          city: state.city.value,
          zip: state.zip.value,
          speaks: speaks,
        ));
        result.fold((l) {
          emit(state.copyWith(status: FormzStatus.submissionFailure, errorMessage: l.message));
        }, (r) {
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
          _authenticationCubit.updateUser(r);
        });
      }
    }
  }
}
