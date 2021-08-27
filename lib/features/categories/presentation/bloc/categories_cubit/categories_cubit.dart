import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/usecases/get_categories_usecase.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUsecase _getCategoriesUsecase;

  CategoriesCubit({required GetCategoriesUsecase getCategoriesUsecase})
      : _getCategoriesUsecase = getCategoriesUsecase,
        super(CategoriesState());

  void fetchCategories() async {
    emit(state.copyWith(isLoading: true));
    final result = await _getCategoriesUsecase(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (categories) => emit(state.copyWith(categories: categories)),
    );
  }
}
