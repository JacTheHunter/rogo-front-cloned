part of 'add_publication_cubit.dart';

@immutable
class AddPublicationState extends Equatable {
  final int currentStep;
  final bool? isFeed;
  final int? selectedCardId;
  final List<String> pickedImagesPaths;
  final Category? selectedCategory;

  AddPublicationState(
      {this.currentStep = 0,
      this.isFeed,
      this.selectedCardId,
      this.pickedImagesPaths = const [],
      this.selectedCategory});

  AddPublicationState copyWith({
    int? currentStep,
    bool? isFeed,
    int? selectedCardId,
    List<String>? pickedImagesPaths,
    Category? selectedCategory,
  }) {
    return AddPublicationState(
      currentStep: currentStep ?? this.currentStep,
      isFeed: isFeed ?? this.isFeed,
      selectedCardId: selectedCardId ?? this.selectedCardId,
      pickedImagesPaths: pickedImagesPaths ?? this.pickedImagesPaths,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [
        currentStep,
        isFeed,
        selectedCardId,
        pickedImagesPaths,
        selectedCategory,
      ];
}
