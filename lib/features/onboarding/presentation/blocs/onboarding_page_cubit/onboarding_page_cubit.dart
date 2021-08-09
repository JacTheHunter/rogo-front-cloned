import 'package:bloc/bloc.dart';

class OnboardingPageCubit extends Cubit<int> {
  OnboardingPageCubit() : super(1);

  void setLanguage(String lang) {
    emit(state + 1);
  }

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}
