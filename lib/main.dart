import 'dart:ui';
import 'package:go_todo/StateManagement/provider1.dart';
import 'package:provider/provider.dart';
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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> DataStateProvider()),
      ],
      child: MaterialApp(
        title: 'Go-Todo',
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(

          secondaryHeaderColor: const Color(0xff1E1E1E),//secondary backgroud color
          iconTheme: const IconThemeData(
            color: Colors.white54
          ),
          textTheme: const TextTheme(
            subtitle1: TextStyle(
              color: Colors.white54
            ),

          ),
          backgroundColor: const Color(0xff101010),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff272727)
          ),
          scaffoldBackgroundColor: const Color(0xff101010),

        ),

        //................................................................................................................................
        theme: ThemeData(

          secondaryHeaderColor: const Color(0xffF4F8FF),//secondary background color
          iconTheme: const IconThemeData(
            color: Color(0xff888888)
          ),
          textTheme: const TextTheme(
              subtitle1: TextStyle(
                  color: Color(0xff222222)
              )
          ),
          scaffoldBackgroundColor:const Color(0xffFDFDFD),
          backgroundColor: const Color(0xffFDFDFD) ,
          appBarTheme: const AppBarTheme(
            color: Color(0xff3E6FF5)
          ),
        ),

          //primarySwatch: Colors.blue,

        home: const NavigationScreen(),

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
    )
    );
  }
}
