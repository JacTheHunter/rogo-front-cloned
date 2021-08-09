import 'package:bloc/bloc.dart';

class AppNavBarCubit extends Cubit<int> {
  AppNavBarCubit() : super(0);

  bool canSetPage = false;

  void setPage(int index) async {
    emit(index);

    // if ((state - index).abs() > 1) {
    //   final stateIndex = state;
    //   if (index < state) {
    //     for (var i = 0; i < (stateIndex - index).abs(); i++) {
    //       emit(state - 1);
    //       await Future.delayed(Duration(milliseconds: 500));
    //     }
    //   } else {
    //     for (var i = 0; i < (stateIndex - index).abs(); i++) {
    //       emit(state + 1);
    //       await Future.delayed(Duration(milliseconds: 500));
    //     }

    //     await Future.delayed(Duration(milliseconds: 500));
    //   }
    // } else {
    //   emit(index);
    // }
  }

  // @override
  // int fromJson(Map<String, dynamic> json) => json['value'] as int;

  // @override
  // Map<String, int> toJson(int state) => {'value': state};
}
