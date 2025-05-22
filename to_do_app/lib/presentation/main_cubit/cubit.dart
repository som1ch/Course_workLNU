import 'package:flutter/material.dart';
import 'package:to_do_app/presentation/base_cubit.dart';

final class MainCubit<State> extends BaseCubit {
  MainCubit() : super(State);

  void login() {}

  void logout() {}

  void addNote() {}

  void deleteNote() {}

  @override
  void handleError(String errorMessage) {
    // Handle error here
    debugPrint('Error: $errorMessage');
  }
}
