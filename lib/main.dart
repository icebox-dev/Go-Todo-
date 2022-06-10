import 'package:flutter/material.dart';
import 'package:go_todo/navigation_screen.dart';

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
        scaffoldBackgroundColor: Colors.lightBlue,

            textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white
          )
      ),
      extensions: const <ThemeExtension<dynamic>>[

      ]





      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.red,
        appBarTheme: AppBarTheme(

        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const NavigationScreen(),
    );
  }
}
