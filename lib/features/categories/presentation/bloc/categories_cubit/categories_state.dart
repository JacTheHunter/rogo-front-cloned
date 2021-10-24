part of 'categories_cubit.dart';

@immutable
class CategoriesState {
  final List<Category> categories;
  final Category? selectedCategory;
  final String errorMessage;
  final bool isLoading;

  CategoriesState({
    this.categories = const [],
    this.errorMessage = '',
    this.isLoading = false,
    this.selectedCategory,
  });

  CategoriesState copyWith({
    List<Category>? categories,
    Category? selectedCategory,
    String? errorMessage,
    bool? isLoading,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      errorMessage: errorMessage ?? '',
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isLoading: isLoading ?? false,
    );
  }
}
