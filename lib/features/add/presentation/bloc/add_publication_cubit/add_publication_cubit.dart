import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:rogo/core/form_models/categories_form_model.dart';
import 'package:rogo/core/form_models/city_form_model.dart';
import 'package:rogo/core/form_models/country_form_model.dart';
import 'package:rogo/features/add/domain/usecases/create_live_search_publication_usecase.dart';
import 'package:rogo/features/categories/presentation/bloc/categories_cubit/categories_cubit.dart';
import 'package:rogo/features/countries_and_cities/presentation/blocs/countries_and_cities_cubit/countries_and_cities_cubit.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/form_models/card_credentials_form_models.dart';
import '../../../../../core/form_models/description_form_model.dart';
import '../../../../../core/form_models/first_name_form_model.dart';
import '../../../../../core/form_models/prices_form_models.dart';
import '../../../../../core/form_models/zip_form_model.dart';
import '../../../../categories/domain/entities/category.dart';
import '../../../../countries_and_cities/domain/entities/city.dart';
import '../../../../countries_and_cities/domain/entities/country.dart';

part 'add_publication_state.dart';

class AddPublicationCubit extends Cubit<AddPublicationState> {
  final CreateLiveSearchPublicationUseCase _createLiveSearchPublicationUseCase;
  final CountriesAndCitiesCubit _countriesAndCitiesCubit;
  final CategoriesCubit _categoriesCubit;
  AddPublicationCubit({
    required CountriesAndCitiesCubit countriesAndCitiesCubit,
    required CreateLiveSearchPublicationUseCase createLiveSearchPublicationUseCase,
    required CategoriesCubit categoriesCubit,
  })  : _countriesAndCitiesCubit = countriesAndCitiesCubit,
        _createLiveSearchPublicationUseCase = createLiveSearchPublicationUseCase,
        _categoriesCubit = categoriesCubit,
        super(AddPublicationState());

  void selectPublicationType(int value) {
    if (value == 1) {
      emit(state.copyWith(isFeed: true));
    } else if (value == 2) {
      emit(state.copyWith(isFeed: false));
    }
  }

  void selectCard(int id) {
    emit(state.copyWith(selectedCardId: id));
  }

  bool isValidNewCard() {
    final cardHName = CardHolderNameFormModel.dirty(state.cardHolderName.value);
    final cardN = CardNumberFormModel.dirty(state.cardNumber.value);
    final cardExp = CardExpirationDateFormModel.dirty(state.cardExpireDate.value);
    final cardC = CardCvvFormModel.dirty(state.cardCvv.value);
    emit(
      state.copyWith(
        status: Formz.validate(
          [
            cardHName,
            cardN,
            cardExp,
            cardC,
          ],
        ),
        cardHolderName: cardHName,
        cardNumber: cardN,
        cardExpireDate: cardExp,
        cardCvv: cardC,
      ),
    );
    if (state.status.isValidated) {
      return true;
    }
    return false;
  }

  void incrementStep() {
    if (state.currentStep == 5) {
      final rntPrice = RentalPriceFormModel.dirty(state.rentalPrice.value);
      final pr = PriceFormModel.dirty(state.price.value);
      final blsPr = BLSpriceFormModel.dirty(state.blsPrice.value);
      emit(
        state.copyWith(
          status: Formz.validate(
            [
              rntPrice,
              pr,
              blsPr,
            ],
          ),
          rentalPrice: rntPrice,
          price: pr,
          blsPrice: blsPr,
        ),
      );
      if (state.status.isValidated) {
        emit(state.copyWith(currentStep: state.currentStep + 1));
      }
      return;
    }

    if (state.currentStep == 4) {
      final ctry = CountryFormModel.dirty(state.country.value);
      final ct = CityFormModel.dirty(state.city.value);
      final zp = ZipFormModel.dirty(state.zip.value);
      emit(
        state.copyWith(
          status: Formz.validate(
            [
              ctry,
              ct,
              zp,
            ],
          ),
          country: ctry,
          city: ct,
          zip: zp,
        ),
      );
      if (state.status.isValidated) {
        emit(state.copyWith(currentStep: state.currentStep + 1));
      }
      return;
    }

    if (state.currentStep == 3) {
      final ca = CategoriesFormModel.dirty(state.category.value);
      final tt = FirstNameFormModel.dirty(state.title.value);
      final desc = DescriptionFormModel.dirty(state.description.value);
      emit(
        state.copyWith(
          status: Formz.validate(
            [
              ca,
              tt,
              desc,
            ],
          ),
          category: ca,
          title: tt,
          description: desc,
        ),
      );
      if (state.status.isValidated && state.pickedImagesPaths.isNotEmpty) {
        emit(state.copyWith(currentStep: state.currentStep + 1));
      }
      return;
    }

    if (state.currentStep == 1 && state.isFeed == false) {
      final tt = FirstNameFormModel.dirty(state.title.value);
      final desc = DescriptionFormModel.dirty(state.description.value);
      emit(
        state.copyWith(
          status: Formz.validate(
            [
              tt,
              desc,
            ],
          ),
          title: tt,
          description: desc,
        ),
      );
      if (state.status.isValidated && state.pickedImagesPaths.isNotEmpty) {
        emit(state.copyWith(currentStep: state.currentStep + 1));
      }
      return;
    }

    if (state.currentStep == 2 && state.isFeed == false) {
      final ctry = CountryFormModel.dirty(state.country.value);
      final ct = CityFormModel.dirty(state.city.value);
      final zp = ZipFormModel.dirty(state.zip.value);
      emit(
        state.copyWith(
          status: Formz.validate(
            [
              ctry,
              ct,
              zp,
            ],
          ),
          country: ctry,
          city: ct,
          zip: zp,
        ),
      );
      if (state.status.isValidated) {
        emit(state.copyWith(currentStep: state.currentStep + 1));
      }
      return;
    }

    if (state.currentStep == 3 && state.isFeed == false && state.rangeStartDay != null && state.rangeEndDay != null) {
      _createLiveSearchPublicationUseCase(CreateLiveSearchParams(
        title: state.title.value,
        description: state.description.value,
        zip: state.zip.value,
        startAt: state.rangeStartDay!,
        endAt: state.rangeEndDay!,
        rentalPriceRange: '${state.defaultRangeValues.start}-${state.defaultRangeValues.end}',
        deadline: DateTime.now(), //TODO: solve deadline
        city: state.selectedCity?.id ?? 0,
        images: state.pickedImagesPaths,
      ));
    }
    emit(state.copyWith(currentStep: state.currentStep + 1));
  }

  void decrementStep() {
    emit(state.copyWith(currentStep: state.currentStep - 1));
  }

  void addPhoto(String path) {
    List<String> stateList = List.from(state.pickedImagesPaths);
    emit(state.copyWith(pickedImagesPaths: stateList..add(path)));
  }

  void removePhoto(String path) {
    List<String> stateList = List.from(state.pickedImagesPaths);
    emit(state.copyWith(pickedImagesPaths: stateList..remove(path)));
  }

  void clearPhotoList() {
    List<String> stateList = List.from(state.pickedImagesPaths);
    emit(state.copyWith(pickedImagesPaths: stateList..clear()));
  }

  // void selectCategory(Category? category) {
  //   if (category != null) emit(state.copyWith(selectedCategory: category));
  // }

  // void selectCountry(Country? country) {
  //   if (country != null) _countriesAndCitiesCubit.selectCountry(country.id);
  //   if (country != null) emit(state.copyWith(selectedCountry: country));
  // }

  // void selectCity(City? city) {
  //   if (city != null) emit(state.copyWith(selectedCity: city));
  // }

  void updateRangeValues(RangeValues values) {
    emit(state.copyWith(defaultRangeValues: values));
  }

//! Calendar
  void onDaySelected(
    DateTime? selectedDay,
    DateTime? focusedDay,
  ) {
    emit(state.copyWith(
      selectedDay: selectedDay,
      focusedDay: focusedDay,
    ));
  }

  void onRangeSelected(
    DateTime? rangeStartDay,
    DateTime? rangeEndDay,
    DateTime? focusedDay,
  ) {
    emit(state.copyWith(
      rangeStartDay: rangeStartDay,
      rangeEndDay: rangeEndDay,
      focusedDay: focusedDay,
    ));
  }

  void calendarModeToggle(RangeSelectionMode? rangeSelectionMode) {
    emit(state.copyWith(rangeSelectionMode: rangeSelectionMode));
  }

  void resetSelectedDay() {
    emit(AddPublicationState(
      currentStep: state.currentStep,
      isFeed: state.isFeed,
      selectedCardId: state.selectedCardId,
      pickedImagesPaths: state.pickedImagesPaths,
      selectedCategory: state.selectedCategory,
      selectedCountry: state.selectedCountry,
      selectedCity: state.selectedCity,
      defaultRangeValues: state.defaultRangeValues,
      rangeStartDay: state.rangeStartDay,
      rangeEndDay: state.rangeEndDay,
      focusedDay: state.focusedDay,
      rangeSelectionMode: state.rangeSelectionMode,

      title: state.title,
      description: state.description,
      zip: state.zip,
      blsPrice: state.blsPrice,
      rentalPrice: state.rentalPrice,
      price: state.price,
      cardHolderName: state.cardHolderName,
      cardNumber: state.cardNumber,
      cardCvv: state.cardCvv,
      cardExpireDate: state.cardExpireDate,
      errorMessage: state.errorMessage,
      status: state.status,

      //continue everything except selectedDay, and thats all))
    ));
  }

  void resetStartEndDays() {
    emit(AddPublicationState(
      currentStep: state.currentStep,
      isFeed: state.isFeed,
      selectedCardId: state.selectedCardId,
      pickedImagesPaths: state.pickedImagesPaths,
      selectedCategory: state.selectedCategory,
      selectedCountry: state.selectedCountry,
      selectedCity: state.selectedCity,
      defaultRangeValues: state.defaultRangeValues,
      focusedDay: state.focusedDay,
      selectedDay: state.selectedDay,
      rangeSelectionMode: state.rangeSelectionMode,

      //WhiteSpace

      title: state.title,
      description: state.description,
      zip: state.zip,
      blsPrice: state.blsPrice,
      rentalPrice: state.rentalPrice,
      price: state.price,
      cardHolderName: state.cardHolderName,
      cardNumber: state.cardNumber,
      cardCvv: state.cardCvv,
      cardExpireDate: state.cardExpireDate,
      errorMessage: state.errorMessage,
      status: state.status,
    ));
  }

  void resetAllDays() {
    emit(AddPublicationState(
      currentStep: state.currentStep,
      isFeed: state.isFeed,
      selectedCardId: state.selectedCardId,
      pickedImagesPaths: state.pickedImagesPaths,
      selectedCategory: state.selectedCategory,
      selectedCountry: state.selectedCountry,
      selectedCity: state.selectedCity,
      defaultRangeValues: state.defaultRangeValues,

      title: state.title,
      description: state.description,
      zip: state.zip,
      blsPrice: state.blsPrice,
      rentalPrice: state.rentalPrice,
      price: state.price,
      cardHolderName: state.cardHolderName,
      cardNumber: state.cardNumber,
      cardCvv: state.cardCvv,
      cardExpireDate: state.cardExpireDate,
      errorMessage: state.errorMessage,
      status: state.status,
      //continue everything except selectedDay, and thats all))
    ));
  }

  //!Api and validation
  void updateTitle(String value) {
    final title = FirstNameFormModel.dirty(value);
    emit(
      state.copyWith(
        title: title.valid ? title : FirstNameFormModel.pure(value),
        status: Formz.validate(
          [
            title,
            state.description,
            state.zip,
            state.rentalPrice,
            state.price,
            state.blsPrice,
            state.cardHolderName,
            state.cardNumber,
            state.cardCvv,
            state.cardExpireDate,
            state.country,
            state.zip,
          ],
        ),
      ),
    );
  }

  void updateDescription(String value) {
    final description = DescriptionFormModel.dirty(value);
    emit(
      state.copyWith(
        description: description.valid ? description : DescriptionFormModel.pure(value),
        status: Formz.validate(
          [
            description,
            state.title,
            state.zip,
            state.rentalPrice,
            state.price,
            state.blsPrice,
            state.cardHolderName,
            state.cardNumber,
            state.cardCvv,
            state.cardExpireDate,
            state.country,
            state.zip,
          ],
        ),
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
          selectedCountry: country,
          status: Formz.validate(
            [
              co,
              state.city,
              state.zip,
              state.title,
              state.description,
              state.rentalPrice,
              state.price,
              state.blsPrice,
              state.cardHolderName,
              state.cardNumber,
              state.cardCvv,
              state.cardExpireDate,
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
          selectedCity: city,
          status: Formz.validate(
            [
              ci,
              state.country,
              state.zip,
              state.title,
              state.description,
              state.rentalPrice,
              state.price,
              state.blsPrice,
              state.cardHolderName,
              state.cardNumber,
              state.cardCvv,
              state.cardExpireDate,
            ],
          ),
        ),
      );
    }
  }

  void updateCategory(Category? category) {
    if (category != null) {
      _categoriesCubit.selectCategory(category.id);
      final ca = CategoriesFormModel.dirty(category.id);
      emit(
        state.copyWith(
          category: ca.valid ? ca : CategoriesFormModel.pure(category.id),
          selectedCategory: category,
          status: Formz.validate(
            [
              ca,
              state.country,
              state.city,
              state.zip,
              state.title,
              state.description,
              state.rentalPrice,
              state.price,
              state.blsPrice,
              state.cardHolderName,
              state.cardNumber,
              state.cardCvv,
              state.cardExpireDate,
            ],
          ),
        ),
      );
    }
  }

  void updateZip(String value) {
    final zip = ZipFormModel.dirty(value);
    emit(
      state.copyWith(
        zip: zip.valid ? zip : ZipFormModel.pure(value),
        status: Formz.validate(
          [
            zip,
            state.title,
            state.description,
            state.rentalPrice,
            state.price,
            state.blsPrice,
            state.cardHolderName,
            state.cardNumber,
            state.cardCvv,
            state.cardExpireDate,
            state.country,
            state.zip,
          ],
        ),
      ),
    );
  }

  void updateRentalPrice(String value) {
    final rentalPrice = RentalPriceFormModel.dirty(value);
    emit(
      state.copyWith(
        rentalPrice: rentalPrice.valid ? rentalPrice : RentalPriceFormModel.pure(value),
        status: Formz.validate(
          [
            rentalPrice,
            state.blsPrice,
            state.price,
            state.title,
            state.description,
            state.zip,
            state.cardHolderName,
            state.cardNumber,
            state.cardCvv,
            state.cardExpireDate,
            state.country,
            state.zip,
          ],
        ),
      ),
    );
  }

  void updatePrice(String value) {
    final price = PriceFormModel.dirty(value);
    emit(
      state.copyWith(
        price: price.valid ? price : PriceFormModel.pure(value),
        status: Formz.validate(
          [
            price,
            state.rentalPrice,
            state.blsPrice,
            state.title,
            state.description,
            state.zip,
            state.cardHolderName,
            state.cardNumber,
            state.cardCvv,
            state.cardExpireDate,
            state.country,
            state.zip,
          ],
        ),
      ),
    );
  }

  void updateBLSprice(String value) {
    final blsPrice = BLSpriceFormModel.dirty(value);
    emit(
      state.copyWith(
        blsPrice: blsPrice.valid ? blsPrice : BLSpriceFormModel.pure(value),
        status: Formz.validate(
          [
            blsPrice,
            state.price,
            state.rentalPrice,
            state.title,
            state.description,
            state.zip,
            state.cardHolderName,
            state.cardNumber,
            state.cardExpireDate,
            state.cardCvv,
            state.country,
            state.zip,
          ],
        ),
      ),
    );
  }

  void updateCardHolderName(String value) {
    final cardHolderName = CardHolderNameFormModel.dirty(value);
    print(state.cardHolderName.valid ? 'valid' : 'invalid');
    emit(
      state.copyWith(
        cardHolderName: cardHolderName.valid ? cardHolderName : CardHolderNameFormModel.pure(value),
        status: Formz.validate(
          [
            cardHolderName,
            state.price,
            state.rentalPrice,
            state.blsPrice,
            state.title,
            state.description,
            state.zip,
            state.cardNumber,
            state.cardCvv,
            state.cardExpireDate,
            state.country,
            state.zip,
          ],
        ),
      ),
    );
  }

  void updateCardNumber(String value) {
    final cardNumber = CardNumberFormModel.dirty(value);
    emit(
      state.copyWith(
        cardNumber: cardNumber.valid ? cardNumber : CardNumberFormModel.pure(value),
        status: Formz.validate(
          [
            cardNumber,
            state.rentalPrice,
            state.blsPrice,
            state.title,
            state.description,
            state.zip,
            state.cardHolderName,
            state.cardCvv,
            state.cardExpireDate,
            state.price,
            state.country,
            state.zip,
          ],
        ),
      ),
    );
  }

  void updateCardExpireDate(String value) {
    final cardExpireDate = CardExpirationDateFormModel.dirty(value);
    emit(
      state.copyWith(
        cardExpireDate: cardExpireDate.valid ? cardExpireDate : CardExpirationDateFormModel.pure(value),
        status: Formz.validate(
          [
            cardExpireDate,
            state.price,
            state.rentalPrice,
            state.blsPrice,
            state.title,
            state.description,
            state.zip,
            state.cardHolderName,
            state.cardNumber,
            state.cardCvv,
            state.country,
            state.zip,
          ],
        ),
      ),
    );
  }

  void updateCardCvv(String value) {
    final cardCvv = CardCvvFormModel.dirty(value);
    emit(
      state.copyWith(
        cardCvv: cardCvv.valid ? cardCvv : CardCvvFormModel.pure(value),
        status: Formz.validate(
          [
            cardCvv,
            state.price,
            state.rentalPrice,
            state.blsPrice,
            state.title,
            state.description,
            state.zip,
            state.cardHolderName,
            state.cardNumber,
            state.cardExpireDate,
            state.country,
            state.zip,
          ],
        ),
      ),
    );
  }
}
