part of 'theme_bloc.dart';

enum ThemeStatus {
  initial,
  loading,
  success,
  error,
}

class ThemeState {
  final ThemeStatus status;
  final String? errorMessage;

  final ThemeData? themeData;

  ThemeState._({required this.status, this.errorMessage, this.themeData});

  factory ThemeState.initial() => ThemeState._(status: ThemeStatus.initial);

  ThemeState copyWith({
    ThemeStatus? status,
    String? errorMessage,
    ThemeData? themeData,
  }) => ThemeState._(
    status: status ?? this.status,
    errorMessage: errorMessage ?? this.errorMessage,
    themeData: themeData ?? this.themeData,
  );
}