import 'package:formz/formz.dart';

enum RentalPriceFormModelValidationError { empty }
enum PriceFormModelValidationError { empty }
enum BLSpriceFormModelValidationError { empty }

class RentalPriceFormModel extends FormzInput<String, RentalPriceFormModelValidationError> {
  const RentalPriceFormModel.pure([String value = '']) : super.pure(value);
  const RentalPriceFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  RentalPriceFormModelValidationError? validator(String value) {
    return value.length > 0 ? null : RentalPriceFormModelValidationError.empty;
  }
}

class PriceFormModel extends FormzInput<String, PriceFormModelValidationError> {
  const PriceFormModel.pure([String value = '']) : super.pure(value);
  const PriceFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  PriceFormModelValidationError? validator(String value) {
    return value.length > 0 ? null : PriceFormModelValidationError.empty;
  }
}

class BLSpriceFormModel extends FormzInput<String, BLSpriceFormModelValidationError> {
  const BLSpriceFormModel.pure([String value = '']) : super.pure(value);
  const BLSpriceFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  BLSpriceFormModelValidationError? validator(String value) {
    return value.length > 0 ? null : BLSpriceFormModelValidationError.empty;
  }
}
