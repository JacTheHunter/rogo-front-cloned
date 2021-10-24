import 'package:formz/formz.dart';

enum CategoriesFormModelValidationError { empty }

class CategoriesFormModel extends FormzInput<int, CategoriesFormModelValidationError> {
  const CategoriesFormModel.pure([int value = 0]) : super.pure(value);
  const CategoriesFormModel.dirty([int value = 0]) : super.dirty(value);

  @override
  CategoriesFormModelValidationError? validator(int value) {
    return value > 0 ? null : CategoriesFormModelValidationError.empty;
  }
}
