import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_tv/theme/theme.dart';

final class AppTheme extends ChangeNotifier {
  late ThemeMode _themeMode;
  ThemeMode get  themeMode => _themeMode;
  AppTheme(){
    _init();
  }



  bool get isDark => _themeMode == ThemeMode.dark;
  void toggleMode({ThemeMode? mode}){

    if(mode != null) {
      _themeMode = mode;
      notifyListeners();
      return;
    }
    if(themeMode == ThemeMode.light){

      _themeMode = ThemeMode.dark;
      notifyListeners();
      return;
    }
    if(themeMode == ThemeMode.dark){
      _themeMode = ThemeMode.light;
      notifyListeners();
    }

  }

  void _init(){
    _themeMode = ThemeMode.dark;
  }

  ThemeData get darkTheme {
    final colors = ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: CustomTheme.primaryColor,
        primary: CustomTheme.primaryColor
    );
    return _baseTheme.copyWith(
        useMaterial3: true,
        colorScheme: colors,
        scaffoldBackgroundColor: CustomTheme.black_window,
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: CustomTheme.primaryColorRed,
        ),

      dialogTheme: DialogTheme(
        titleTextStyle: _baseTheme.textTheme.titleLarge?.copyWith(
          fontSize: 24,
          color: colors.primary
        ),
        backgroundColor: colors.surface,
        contentTextStyle: _baseTheme.textTheme.bodyMedium?.copyWith(
          color: colors.onSurface
        ),
      )
    );
  }
  ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: CustomTheme.primaryColor,

    );
    return _baseTheme.copyWith(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
           color: colorScheme.primary,
           foregroundColor: Colors.white,
        ),
    );
  }
  
  ThemeData get _baseTheme =>  ThemeData(
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(CustomTheme.primaryColorRed),
    ),

  );

  // ColorScheme get darkColors =>
  //     ColorScheme(
  //       brightness: Brightness.dark,
  //       primary: CustomTheme.primaryColor,
  //       onPrimary: CustomTheme.whiteColor,
  //       background: CustomTheme.darkGrey,
  //       onBackground:CustomTheme.whiteColor,
  //       error: CustomTheme.primaryColorRed,
  //       onError: CustomTheme.whiteColor,
  //       surface: CustomTheme.primaryColorDark,
  //       onSurface: CustomTheme.whiteColor,
  //       secondary: CustomTheme.amber_800,
  //       onSecondary: CustomTheme.whiteColor,
  //     );
  // ColorScheme get lightColors =>
  //     ColorScheme(
  //       brightness: Brightness.light,
  //       primary: CustomTheme.primaryColor,
  //       onPrimary: Colors.white,
  //       background: CustomTheme.grey_transparent2,
  //       onBackground: Colors.black,
  //       error: CustomTheme.primaryColorRed,
  //       onError: CustomTheme.whiteColor,
  //       surface: CustomTheme.raveColor,
  //       onSurface: Colors.black,
  //       secondary: CustomTheme.amber_800,
  //       onSecondary: CustomTheme.whiteColor,
  //     );
}