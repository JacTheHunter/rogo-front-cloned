import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rogo/features/categories/domain/entities/category.dart';

part 'add_publication_state.dart';

class AddPublicationCubit extends Cubit<AddPublicationState> {
  AddPublicationCubit() : super(AddPublicationState());

  void selectPublicationType(int value) {
    if (value == 1) {
      emit(state.copyWith(isFeed: true));
    } else if (value == 2) {
      emit(state.copyWith(isFeed: false));
    }
  }

  void selectCard(int id) {
    emit(state.copyWith(selectedCardId: id));
  }

  void incrementStep() {
    emit(state.copyWith(currentStep: state.currentStep + 1));
  }

  void decrementStep() {
    emit(state.copyWith(currentStep: state.currentStep - 1));
  }

  void addPhoto(String path) {
    List<String> stateList = List.from(state.pickedImagesPaths);
    emit(state.copyWith(pickedImagesPaths: stateList..add(path)));
  }

  void selectCategory(Category? category) {
    if (category != null) emit(state.copyWith(selectedCategory: category));
  }

  void removePhoto(String path) {
    List<String> stateList = List.from(state.pickedImagesPaths);
    emit(state.copyWith(pickedImagesPaths: stateList..remove(path)));
  }
}
