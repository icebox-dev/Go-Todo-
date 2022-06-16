import 'dart:ui';

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

        secondaryHeaderColor: Color(0xff1E1E1E),//secondary backgroud color
        iconTheme: IconThemeData(
          color: Colors.white54
        ),
        textTheme: TextTheme(
          subtitle1: TextStyle(
            color: Colors.white54
          ),

        ),
        backgroundColor: Color(0xff101010),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff272727)
        ),
        scaffoldBackgroundColor: Color(0xff101010),

      ),

      //................................................................................................................................
      theme: ThemeData(

        secondaryHeaderColor: Color(0xffF4F8FF),//secondary background color
        iconTheme: IconThemeData(
          color: Color(0xff888888)
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
      home: const NavigationScreen(),
    );
  }
}
