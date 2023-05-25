import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_1/utils/apptheme.dart';
import 'package:weather_app_1/views/screens/homepage.dart';
import 'package:weather_app_1/views/screens/splash_screen.dart';
import 'controller/provider/theme_provider.dart';
import 'controller/weather_provider.dart';
import 'models/Connectivity_Model.dart';
import 'models/theme_model.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isDarkTheme = prefs.getBool('isDark') ?? false;

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) =>
              ThemeProvider(themeModel: ThemeModel(isDark: isDarkTheme))),
          ChangeNotifierProvider(create: (context) => ConnectivityProvider(),),
          ChangeNotifierProvider(create: (context) => WeatherProvider(),)
        ],
        builder: (context, _) {
          return MaterialApp(
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode:
            (Provider.of<ThemeProvider>(context).themeModel.isDark == true)
                ? ThemeMode.light
                : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            initialRoute: 'intro_page',
            routes: {
              //'/': (context) => SplashScreen(),
              '/': (context) => homepage(),
              'intro_page': (context) => intro_page(),
            },
          );
        },
      )
  );
}

