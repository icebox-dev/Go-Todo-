
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService extends ChangeNotifier {



  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();


  Future initialize()async{
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

     final InitializationSettings initializationSettings =
         InitializationSettings(android: androidInitializationSettings);

     await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  }

  Future instantNotification () async {

    var android = AndroidNotificationDetails("id", "channel");
    var ios = IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: ios);
    await flutterLocalNotificationsPlugin.show(0, "demo instant notification","yeyeyeyeii",platform,payload: "welcome");

  }

  Future sheduleNotification (DateTime dateTime,String title,String description) async{
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation("Asia/Calcutta"));
    var intervel = RepeatInterval.everyMinute;
    var bigpicure = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      largeIcon:  DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      contentTitle: title,
      summaryText: description,
      htmlFormatContent: true,
      htmlFormatContentTitle: true,
    );

    var android = AndroidNotificationDetails("id", "channel",styleInformation: bigpicure);
    var platform = NotificationDetails(android: android);
    print(DateTime.now());

    // await flutterLocalNotificationsPlugin.periodicallyShow(0, "Demo notification", "Body of demo notification", sheduleTime, platform);
    await flutterLocalNotificationsPlugin.schedule(0, title,description, dateTime,platform);
  }
  Future shedulePeriodicalNotification (DateTime dateTime,String title,String description) async{
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation("Asia/Calcutta"));
    var intervel = RepeatInterval.everyMinute;
    var bigpicure = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      largeIcon:  DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      contentTitle: title,
      summaryText: description,
      htmlFormatContent: true,
      htmlFormatContentTitle: true,
    );

    var android = AndroidNotificationDetails("id", "channel",styleInformation: bigpicure);
    var platform = NotificationDetails(android: android);
    print(DateTime.now());

    await flutterLocalNotificationsPlugin.periodicallyShow(0, "Demo notification", "Body of demo notification", intervel, platform);
    //await flutterLocalNotificationsPlugin.schedule(0, title,description, dateTime,platform);
  }

  Future cancelNotification()async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }



}


