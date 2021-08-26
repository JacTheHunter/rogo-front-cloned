import 'package:formz/formz.dart';

enum ZipFormModelValidationError { empty }

class ZipFormModel extends FormzInput<String, ZipFormModelValidationError> {
  const ZipFormModel.pure([String value = '']) : super.pure(value);
  const ZipFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  ZipFormModelValidationError? validator(String value) {
    return value.length > 0 ? null : ZipFormModelValidationError.empty;
  }
}
