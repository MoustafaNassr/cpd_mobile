
import 'package:flutter/material.dart';

import '../constant/colors.dart';


/// Application theme data
///
/// Use static [theme] method to generate [ThemeData] instead of [InheritedWidget] to reduce build.
class ResTheme {
  /// Provides color scheme for application
  ///
  /// Uses by [theme] function to generate [ThemeData] for application.
  
final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  //backgroundColor: const Color(0xFF212121),
  //accentColor: Colors.white,
  //accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  // backgroundColor: const Color(0xFFE5E5E5),
  // accentColor: Colors.black,
  // accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
); 
}
class AppTheme {
  // Private Constructor
  AppTheme._();static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme:const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme:const TextTheme(
      headlineLarge: TextStyle( fontSize: 30,
      fontWeight: FontWeight.bold,
        color: ResColors.background,
        fontFamily: 'Gilroy'),
      headlineMedium: TextStyle(
        fontSize: 20,
        color: ResColors.primary,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w600,
      
    ),
    displayMedium: TextStyle(
        fontSize: 19,
        color: Colors.black,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w600,
      
    ),
    ),
    // ... more
  );static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 41, 41, 41),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 41, 41, 41),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme:const TextTheme(
      titleMedium: TextStyle(
        color: Colors.white,
        fontFamily:'Gilroy',
      ),
    ),
    // ... more
  );
}