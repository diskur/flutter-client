import 'package:diskur/app/theme/app_theme.dart';
import 'package:diskur/features/theme/data/theme_data.dart';
import 'package:diskur/features/theme/bloc/theme_bloc.dart';
import 'package:flutter/foundation.dart'; // for kDebugMode
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/login_screen.dart';
import 'package:diskur/app/di/get_it.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(BlocProvider(
    create: (content) => 
    getIt<ThemeBloc>()..add(GetThemeEvent()),
    child: BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state){
        return MaterialApp(
          theme: AppTheme.getTheme(state.themeData?.themeType == ThemeType.dark),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: kDebugMode ? Locale('ru') : null,
          home: LoginScreen(),
        );
      }
    )
    )
  );
}
