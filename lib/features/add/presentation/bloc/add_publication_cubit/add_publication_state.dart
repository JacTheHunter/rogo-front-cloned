part of 'add_publication_cubit.dart';

@immutable
class AddPublicationState extends Equatable {
  final int currentStep;
  final bool? isFeed;
  final int? selectedCardId;

  AddPublicationState({
    this.currentStep = 0,
    this.isFeed,
    this.selectedCardId,
  });

  AddPublicationState copyWith({
    int? currentStep,
    bool? isFeed,
    int? selectedCardId,
  }) {
    return AddPublicationState(
      currentStep: currentStep ?? this.currentStep,
      isFeed: isFeed ?? this.isFeed,
      selectedCardId: selectedCardId ?? this.selectedCardId,
    );
  }

  @override
  List<Object?> get props => [currentStep, isFeed, selectedCardId];
}
