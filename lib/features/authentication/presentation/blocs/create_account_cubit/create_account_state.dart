part of 'create_account_cubit.dart';

class CreateAccountState extends Equatable {
  final int step;
  final FirstNameFormModel firstName;
  final LastNameFormModel lastName;
  final BirthDateFormModel birthDate;
  final PhoneNumberFormModel phoneNumber;
  final String phoneCountryCode;
  final bool isPhoneConfirmed;
  final CountryFormModel country;
  final CityFormModel city;
  final ZipFormModel zip;
  final LanguagesFormModel languages;
  final String verificationId;
  final int? forceResendingToken;
  final FormzStatus status;
  final String errorMessage;

  const CreateAccountState({
    this.step = 1,
    this.firstName = const FirstNameFormModel.pure(),
    this.lastName = const LastNameFormModel.pure(),
    this.birthDate = const BirthDateFormModel.pure(),
    this.phoneNumber = const PhoneNumberFormModel.pure(),
    this.phoneCountryCode = '+998',
    this.isPhoneConfirmed = false,
    this.verificationId = '',
    this.forceResendingToken,
    this.country = const CountryFormModel.pure(),
    this.city = const CityFormModel.pure(),
    this.zip = const ZipFormModel.pure(),
    this.languages = const LanguagesFormModel.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage = '',
  });

  CreateAccountState copyWith({
    int? step,
    FirstNameFormModel? firstName,
    LastNameFormModel? lastName,
    BirthDateFormModel? birthDate,
    PhoneNumberFormModel? phoneNumber,
    String? phoneCountryCode,
    bool? isPhoneConfirmed,
    String? verificationId,
    int? forceResendingToken,
    CountryFormModel? country,
    CityFormModel? city,
    ZipFormModel? zip,
    LanguagesFormModel? languages,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return CreateAccountState(
      step: step ?? this.step,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneCountryCode: phoneCountryCode ?? this.phoneCountryCode,
      isPhoneConfirmed: isPhoneConfirmed ?? this.isPhoneConfirmed,
      forceResendingToken: forceResendingToken ?? this.forceResendingToken,
      verificationId: verificationId ?? this.verificationId,
      country: country ?? this.country,
      city: city ?? this.city,
      zip: zip ?? this.zip,
      languages: languages ?? this.languages,
      status: status ?? this.status,
      errorMessage: errorMessage ?? '',
    );
  }

  @override
  List<Object?> get props {
    return [
      step,
      firstName,
      lastName,
      birthDate,
      phoneNumber,
      phoneCountryCode,
      isPhoneConfirmed,
      country,
      city,
      zip,
      languages,
      verificationId,
      forceResendingToken,
      status,
      errorMessage,
    ];
  }
}
