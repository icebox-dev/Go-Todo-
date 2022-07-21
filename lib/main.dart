// import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_todo/StateManagement/google_sign_in.dart';

import 'package:go_todo/StateManagement/provider1.dart';
import 'package:go_todo/StateManagement/provider2Notification.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_todo/Screens/about.dart';
import 'package:go_todo/Screens/task_screen.dart';
import 'package:go_todo/Screens/settings.dart';
import 'package:go_todo/navigation_screen.dart';

import 'Screens/home_screen.dart';
import 'Screens/connecion_screen.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'Screens/home_screen.dart';
import 'Screens/login_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AndroidAlarmManager.initialize();
  NotificationService().initialize();



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (_)=> DataStateProvider()),
        ChangeNotifierProvider(create: (_)=> NotificationService()),
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
            backgroundColor: const Color(0xff101010),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xff272727)),
            scaffoldBackgroundColor: const Color(0xff101010),
          ),

          //................................................................................................................................
          theme: ThemeData(
            secondaryHeaderColor:
                const Color(0xffF4F8FF), //secondary background color
            iconTheme: const IconThemeData(color: Color(0xff888888)),
            textTheme:
                const TextTheme(subtitle1: TextStyle(color: Color(0xff222222))),
            scaffoldBackgroundColor: const Color(0xffFDFDFD),
            backgroundColor: const Color(0xffFDFDFD),
            appBarTheme: const AppBarTheme(color: Color(0xff3E6FF5)),
          ),

          //primarySwatch: Colors.blue,

          initialRoute: '/',
          routes: {
            '/': (context) => const NavigationScreen(),
            '/about': (context) => const AboutScreen(),
            '/login': (context) => LoginScreen(),
            '/connections': (context) => const ConnectionsScreen(),
            '/home': (context) => const HomeScreen(),
            '/task': (context) => const TaskScreen(),
            '/settings': (context) => const SettingsScreen(),
            '/connections': (context) => const ConnectionsScreen(),
            '/home': (context) => const HomeScreen()
          },
          localizationsDelegates: const [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', 'US')],
        ));
  }
}
