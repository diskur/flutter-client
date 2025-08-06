import 'package:diskur/features/theme/bloc/theme_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:diskur/features/theme/domain/repository/theme_repository.dart';

var getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton(await SharedPreferences.getInstance());
  getIt.registerSingleton(ThemeRepository(sharedPreferences: getIt()));
  getIt.registerFactory(() => ThemeBloc(themeRepository: getIt()));
}