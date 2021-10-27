part of 'add_publication_cubit.dart';

@immutable
class AddPublicationState extends Equatable {
  final int currentStep;
  final bool? isFeed;
  final int? selectedCardId;
  final List<String> pickedImagesPaths;
  final Category? selectedCategory;
  final Country? selectedCountry;
  final City? selectedCity;
  final RangeValues defaultRangeValues;
  //For calendar
  final DateTime? selectedDay;
  final DateTime? rangeStartDay;
  final DateTime? rangeEndDay;
  final DateTime? focusedDay;
  final RangeSelectionMode rangeSelectionMode;
  //For api and validation
  final FirstNameFormModel title;
  final CountryFormModel country;
  final CityFormModel city;
  final CategoriesFormModel category;
  final DescriptionFormModel description;
  final ZipFormModel zip;
  final RentalPriceFormModel rentalPrice;
  final PriceFormModel price;
  final BLSpriceFormModel blsPrice;
  final CardHolderNameFormModel cardHolderName;
  final CardNumberFormModel cardNumber;
  final CardExpirationDateFormModel cardExpireDate;
  final CardCvvFormModel cardCvv;
  final DateFormModel rStartDay;
  final DateFormModel rEndDay;
  final FormzStatus status;
  final String errorMessage;

  AddPublicationState({
    this.currentStep = 0,
    this.isFeed,
    this.selectedCardId,
    this.pickedImagesPaths = const [],
    this.selectedCategory,
    this.selectedCountry,
    this.selectedCity,
    this.defaultRangeValues = const RangeValues(60, 150),
    this.rangeStartDay,
    this.rangeEndDay,
    this.selectedDay,
    this.focusedDay,
    this.rangeSelectionMode = RangeSelectionMode.toggledOn,
    this.title = const FirstNameFormModel.pure(),
    this.description = const DescriptionFormModel.pure(),
    this.zip = const ZipFormModel.pure(),
    this.rentalPrice = const RentalPriceFormModel.pure(),
    this.price = const PriceFormModel.pure(),
    this.blsPrice = const BLSpriceFormModel.pure(),
    this.cardHolderName = const CardHolderNameFormModel.pure(),
    this.cardNumber = const CardNumberFormModel.pure(),
    this.cardCvv = const CardCvvFormModel.pure(),
    this.cardExpireDate = const CardExpirationDateFormModel.pure(),
    this.country = const CountryFormModel.pure(),
    this.city = const CityFormModel.pure(),
    this.category = const CategoriesFormModel.pure(),
    this.rStartDay = const DateFormModel.pure(),
    this.rEndDay = const DateFormModel.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage = '',
  });

  AddPublicationState copyWith({
    int? currentStep,
    bool? isFeed,
    int? selectedCardId,
    List<String>? pickedImagesPaths,
    Category? selectedCategory,
    Country? selectedCountry,
    City? selectedCity,
    RangeValues? defaultRangeValues,
    DateTime? selectedDay,
    DateTime? rangeStartDay,
    DateTime? rangeEndDay,
    DateTime? focusedDay,
    RangeSelectionMode? rangeSelectionMode,
    FirstNameFormModel? title,
    DescriptionFormModel? description,
    ZipFormModel? zip,
    RentalPriceFormModel? rentalPrice,
    PriceFormModel? price,
    BLSpriceFormModel? blsPrice,
    CardHolderNameFormModel? cardHolderName,
    CardNumberFormModel? cardNumber,
    CardCvvFormModel? cardCvv,
    CardExpirationDateFormModel? cardExpireDate,
    CountryFormModel? country,
    CityFormModel? city,
    CategoriesFormModel? category,
    DateFormModel? rStartDay,
    DateFormModel? rEndDay,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return AddPublicationState(
      currentStep: currentStep ?? this.currentStep,
      isFeed: isFeed ?? this.isFeed,
      selectedCardId: selectedCardId ?? this.selectedCardId,
      pickedImagesPaths: pickedImagesPaths ?? this.pickedImagesPaths,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedCity: selectedCity ?? this.selectedCity,
      defaultRangeValues: defaultRangeValues ?? this.defaultRangeValues,
      rangeStartDay: rangeStartDay ?? this.rangeStartDay,
      rangeEndDay: rangeEndDay ?? this.rangeEndDay,
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
      rangeSelectionMode: rangeSelectionMode ?? this.rangeSelectionMode,
      title: title ?? this.title,
      description: description ?? this.description,
      zip: zip ?? this.zip,
      rentalPrice: rentalPrice ?? this.rentalPrice,
      price: price ?? this.price,
      blsPrice: blsPrice ?? this.blsPrice,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardNumber: cardNumber ?? this.cardNumber,
      cardExpireDate: cardExpireDate ?? this.cardExpireDate,
      cardCvv: cardCvv ?? this.cardCvv,
      country: country ?? this.country,
      city: city ?? this.city,
      category: category ?? this.category,
      rStartDay: rStartDay ?? this.rStartDay,
      rEndDay: rEndDay ?? this.rEndDay,
      status: status ?? this.status,
      errorMessage: errorMessage ?? '',
    );
  }

  @override
  List<Object?> get props => [
        currentStep,
        isFeed,
        selectedCardId,
        pickedImagesPaths,
        selectedCategory,
        selectedCountry,
        selectedCity,
        defaultRangeValues,
        rangeStartDay,
        rangeEndDay,
        selectedDay,
        focusedDay,
        rangeSelectionMode,
        title,
        description,
        zip,
        rentalPrice,
        price,
        blsPrice,
        cardHolderName,
        cardNumber,
        cardCvv,
        cardExpireDate,
        country,
        city,
        category,
        rStartDay,
        rEndDay,
        status,
        errorMessage,
      ];
}
