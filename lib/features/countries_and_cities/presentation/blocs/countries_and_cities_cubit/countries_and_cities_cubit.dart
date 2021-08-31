import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/city.dart';
import '../../../domain/entities/country.dart';
import '../../../domain/usecases/get_all_cities_of_selected_country_usecase.dart';
import '../../../domain/usecases/get_all_countries_usecase.dart';

part 'countries_and_cities_state.dart';

class CountriesAndCitiesCubit extends Cubit<CountriesAndCitiesState> {
  final GetAllCountriesUseCase _getAllCountriesUseCase;
  final GetAllCitiesOfSelectedCountryUseCase _getAllCitiesOfSelectedCountryUseCase;
  CountriesAndCitiesCubit({
    required GetAllCountriesUseCase getAllCountriesUseCase,
    required GetAllCitiesOfSelectedCountryUseCase getAllCitiesOfSelectedCountryUseCase,
  })  : _getAllCountriesUseCase = getAllCountriesUseCase,
        _getAllCitiesOfSelectedCountryUseCase = getAllCitiesOfSelectedCountryUseCase,
        super(CountriesAndCitiesState());

  void fetchCountries() async {
    emit(state.copyWith(isLoading: true));
    final countriesResult = await _getAllCountriesUseCase.call(CountriesParams());
    countriesResult.fold((l) {
      emit(state.copyWith(errorMessage: l.message));
    }, (r) {
      emit(state.copyWith(countries: r.results));
    });
  }

  void selectCountry(int countryId) async {
    emit(CountriesAndCitiesState(countries: state.countries, isLoading: true));
    final citiesResult = await _getAllCitiesOfSelectedCountryUseCase(CitiesParams(countryId: countryId));
    citiesResult.fold((l) {
      emit(state.copyWith(errorMessage: l.message));
    }, (r) {
      emit(state.copyWith(cities: r.results, selectedCountry: state.countries.firstWhere((c) => c.id == countryId)));
    });
  }

  void selectCity(int cityId) {
    emit(state.copyWith(selectedCity: state.cities.firstWhere((c) => c.id == cityId)));
  }

  void clearState() {
    emit(CountriesAndCitiesState(cities: state.cities));
  }
}
