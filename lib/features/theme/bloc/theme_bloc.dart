import 'dart:async';

import 'package:diskur/features/theme/data/theme_data.dart';
import 'package:diskur/features/theme/domain/repository/theme_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_events.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository themeRepository;

  ThemeBloc({required this.themeRepository}) :super (ThemeState.initial()) {
    on<GetThemeEvent>(onGetThemeEvent);
    on<ToggleThemeEvent>(onToggleThemeEvent);
  }

  Future onGetThemeEvent(GetThemeEvent event, Emitter<ThemeState> emit) async {
    emit(state.copyWith(status: ThemeStatus.loading));
    try {
      var result = await themeRepository.getTheme();
      emit(state.copyWith(status: ThemeStatus.success, themeData: result));
    } catch (e) {
      emit(state.copyWith(status: ThemeStatus.error, errorMessage: e.toString()));
    }
  }

  FutureOr<void> onToggleThemeEvent(ToggleThemeEvent event, Emitter<ThemeState> emit) async {
    if (state.themeData != null) {
      var newThemeType = state.themeData!.themeType == ThemeType.dark ? ThemeType.light : ThemeType.dark;
      var newThemeData = ThemeData(themeType: newThemeType);
      try {
        await themeRepository.saveTheme(newThemeData);
        emit(state.copyWith(status: ThemeStatus.success, themeData: newThemeData));
      } catch (e) {
        emit(state.copyWith(status: ThemeStatus.error, errorMessage: e.toString()));
      }
    }
  }
}