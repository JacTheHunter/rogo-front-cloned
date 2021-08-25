part of 'languages_cubit.dart';

class LanguagesState extends Equatable {
  final List<Language> languages;
  final List<Language> filteredLanguages;
  final List<Language> topLanguages;
  final List<Language> selectedLanguages;
  final String searchPhrase;
  final String errorMessage;
  final bool isLoading;

  const LanguagesState({
    this.languages = const [],
    this.topLanguages = const [],
    this.filteredLanguages = const [],
    this.selectedLanguages = const [],
    this.searchPhrase = '',
    this.errorMessage = '',
    this.isLoading = false,
  });

  @override
  List<Object> get props {
    return [
      languages,
      filteredLanguages,
      topLanguages,
      selectedLanguages,
      searchPhrase,
      errorMessage,
      isLoading,
    ];
  }

  LanguagesState copyWith({
    List<Language>? languages,
    List<Language>? topLanguages,
    List<Language>? filteredLanguages,
    List<Language>? selectedLanguages,
    String? searchPhrase,
    String? errorMessage,
    bool? isLoading,
  }) {
    return LanguagesState(
      languages: languages ?? this.languages,
      filteredLanguages: filteredLanguages ?? this.filteredLanguages,
      topLanguages: topLanguages ?? this.topLanguages,
      selectedLanguages: selectedLanguages ?? this.selectedLanguages,
      searchPhrase: searchPhrase ?? this.searchPhrase,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? false,
    );
  }
}
