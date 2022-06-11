import 'package:flutter/material.dart';
import 'package:go_todo/Screens/about.dart';
import 'package:go_todo/navigation_screen.dart';

import 'Screens/connecion_screen.dart';

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
        scaffoldBackgroundColor: Colors.black12,
    ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue[100],
      ),
      // home: AboutScreen(),
      routes: {
        '/': (context) => const NavigationScreen(),
        '/about': (context) => const AboutScreen(),
        '/connections':(context)=> const ConnectionsScreen()
      },
      initialRoute: '/',
    );
  }
}
