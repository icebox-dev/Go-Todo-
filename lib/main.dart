import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_todo/Screens/about.dart';
import 'package:go_todo/Screens/task_screen.dart';
import 'package:go_todo/Screens/settings.dart';
import 'package:go_todo/navigation_screen.dart';

import 'Screens/home_screen.dart';
import 'Screens/connecion_screen.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go-Todo',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        // primaryColor: Colors.white38,
        primaryColorDark: Colors.white,
        secondaryHeaderColor: Color(0xff1E1E1E),//secondary backgroud color
        iconTheme: IconThemeData(
          color: Colors.blueAccent
        ),
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white54),
        ),
        backgroundColor: Color(0xff101010),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xff272727)),
        scaffoldBackgroundColor: Color(0xff101010),
      ),

      //................................................................................................................................
      theme: ThemeData(
        primaryColorDark: Colors.black,
        secondaryHeaderColor: Color(0xffF4F8FF),//secondary background color
        iconTheme: IconThemeData(
          color: Colors.blueAccent
          // Color(0xff888888)
        ),
        textTheme: TextTheme(
            subtitle1: TextStyle(
                color: Color(0xff222222)
            )
        ),
        scaffoldBackgroundColor:Color(0xffFDFDFD),
        backgroundColor:Color(0xffFDFDFD) ,
        appBarTheme: AppBarTheme(
          color: Color(0xff3E6FF5)
        ),

        //primarySwatch: Colors.blue,
      ),
      // home: AboutScreen(),
      routes: {
        '/': (context) => const NavigationScreen(),
        '/about': (context) => const AboutScreen(),

        '/connections':(context)=> const ConnectionsScreen(),
        '/home':(conetext)=> const HomeScreen(),
        '/task':(context)=> const TaskScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/connections': (context) => const ConnectionsScreen(),
        '/home': (context) => const HomeScreen()
      },
      initialRoute: '/',
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', 'US')],
    );
  }
}
