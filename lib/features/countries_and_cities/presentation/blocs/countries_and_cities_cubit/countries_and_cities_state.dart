part of 'countries_and_cities_cubit.dart';

class CountriesAndCitiesState extends Equatable {
  final List<Country> countries;
  final Country? selectedCountry;
  final List<City> cities;
  final City? selectedCity;
  final String errorMessage;
  final bool isLoading;

  const CountriesAndCitiesState({
    this.countries = const [],
    this.selectedCountry,
    this.cities = const [],
    this.selectedCity,
    this.errorMessage = '',
    this.isLoading = false,
  });

  @override
  List<Object?> get props {
    return [
      countries,
      selectedCountry,
      cities,
      selectedCity,
      errorMessage,
      isLoading,
    ];
  }

  CountriesAndCitiesState copyWith({
    List<Country>? countries,
    Country? selectedCountry,
    List<City>? cities,
    City? selectedCity,
    String? errorMessage,
    bool? isLoading,
  }) {
    return CountriesAndCitiesState(
      countries: countries ?? this.countries,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      cities: cities ?? this.cities,
      selectedCity: selectedCity ?? this.selectedCity,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? false,
    );
  }
}
