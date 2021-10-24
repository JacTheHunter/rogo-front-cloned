import 'package:formz/formz.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

enum CardHolderNameFormModelValidationError { empty, maximum }
enum CardNumberFormModelValidationError { empty, invalid }
enum CardExpirationDateFormModelValidationError { empty, invalid }
enum CardCvvFormModelValidationError { empty, invalid }

class CardHolderNameFormModel extends FormzInput<String, CardHolderNameFormModelValidationError> {
  const CardHolderNameFormModel.pure([String value = '']) : super.pure(value);
  const CardHolderNameFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  CardHolderNameFormModelValidationError? validator(String value) {
    if (value.length == 0) {
      return CardHolderNameFormModelValidationError.empty;
    } else if (value.length > 30) {
      return CardHolderNameFormModelValidationError.maximum;
    } else {
      return null;
    }
  }
}

class CardNumberFormModel extends FormzInput<String, CardNumberFormModelValidationError> {
  const CardNumberFormModel.pure([String value = '']) : super.pure(value);
  const CardNumberFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  CardNumberFormModelValidationError? validator(String value) {
    if (value.length == 0) {
      return CardNumberFormModelValidationError.empty;
    } else if (isCardValidNumber(value, checkLength: true)) {
      return null;
    } else {
      return CardNumberFormModelValidationError.invalid;
    }
  }
}

class CardExpirationDateFormModel extends FormzInput<String, CardExpirationDateFormModelValidationError> {
  const CardExpirationDateFormModel.pure([String value = '']) : super.pure(value);
  const CardExpirationDateFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  CardExpirationDateFormModelValidationError? validator(String value) {
    if (value.length == 0) {
      return CardExpirationDateFormModelValidationError.empty;
    }
    return null;
  }
}

class CardCvvFormModel extends FormzInput<String, CardCvvFormModelValidationError> {
  const CardCvvFormModel.pure([String value = '']) : super.pure(value);
  const CardCvvFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  CardCvvFormModelValidationError? validator(String value) {
    if (value.length == 0) {
      return CardCvvFormModelValidationError.empty;
    }
    return null;
  }
}
