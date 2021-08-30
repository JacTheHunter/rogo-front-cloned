part of 'categories_cubit.dart';

@immutable
class CategoriesState {
  final List<Category> categories;
  final String errorMessage;
  final bool isLoading;

  CategoriesState({
    this.categories = const [],
    this.errorMessage = '',
    this.isLoading = false,
  });

  CategoriesState copyWith({
    List<Category>? categories,
    String? errorMessage,
    bool? isLoading,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? false,
    );
  }
}
