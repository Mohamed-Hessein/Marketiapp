import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class themeCubit extends Cubit<ThemeMode> {
  themeCubit() : super(ThemeMode.light);
  refreshMode() {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }
}
