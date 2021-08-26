import 'package:formz/formz.dart';

enum LanguagesFormModelValidationError { empty }

class LanguagesFormModel extends FormzInput<List<int>, LanguagesFormModelValidationError> {
  const LanguagesFormModel.pure([List<int> value = const []]) : super.pure(value);
  const LanguagesFormModel.dirty([List<int> value = const []]) : super.dirty(value);

  @override
  LanguagesFormModelValidationError? validator(List<int> value) {
    return value.length > 0 ? null : LanguagesFormModelValidationError.empty;
  }
}
