
import 'dart:math';

import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_todo/Services/notification_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../DataList.dart';

class BackGroundLocation extends ChangeNotifier{

  LatLng? currentLocation;
  double? dist;
  void backgroundLocationService() {

    ////
    // 1.  Listen to events (See docs for all 12 available events).
    //

    // Fired whenever a location is recorded
    bg.BackgroundGeolocation.onLocation((bg.Location location) {
      double latitude = location.coords.latitude;
      double longitude = location.coords.longitude;
     currentLocation = LatLng(latitude, longitude);
     notifyListeners();
    });

    // Fired whenever the plugin changes motion-state (stationary->moving and vice-versa)
    // bg.BackgroundGeolocation.onMotionChange((bg.Location location) {
    //   double latitude = location.coords.latitude;
    //   double longitude = location.coords.longitude;
    //   _currentLocation = LatLng(latitude, longitude);
    //   notifyListeners();
    // });

    // Fired whenever the state of location-services changes.  Always fired at boot
    bg.BackgroundGeolocation.onProviderChange((bg.ProviderChangeEvent event) {
     // print('[providerchange] - $event');
    });

    ////
    // 2.  Configure the plugin
    //
    bg.BackgroundGeolocation.ready(bg.Config(
        desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
        distanceFilter: 10.0,
        stopOnTerminate: false,
        startOnBoot: true,
        debug: true,
        logLevel: bg.Config.LOG_LEVEL_VERBOSE
    )).then((bg.State state) {
      if (!state.enabled) {
        ////
        // 3.  Start the plugin.
        //
        bg.BackgroundGeolocation.start();
      }
    });
  }
  void checkDistance(List<DataList> dataList){

    bg.BackgroundGeolocation.onLocation((bg.Location location) {
      double latitude = location.coords.latitude;
      double longitude = location.coords.longitude;
      currentLocation = LatLng(latitude, longitude);

      for(DataList element in dataList){
        //if(element.location != null && currentLocation != null) {
          double lat1 = element.location!.latitude;
          double lon1 = element.location!.longitude;
          double lat2 = currentLocation!.latitude;
          double lon2 = currentLocation!.longitude;
         // print(element.location);
         // print(currentLocation);
          // var p = 0.017453292519943295;
          // var c = cos;
          // var a = 0.5 - c((lat2 - lat1) * p)/2 +
          // c(lat1 * p) * c(lat2 * p) *
          // (1 - c((lon2 - lon1) * p))/2;
          // double distance = 12742 * asin(sqrt(a));
          double distance =  Geolocator.distanceBetween(lat1, lon1,lat2,lon2);
          dist = distance;
          notifyListeners();
          print("******************************++==++=********************");

          print(distance);
          if(distance <= 100){
            //NotificationService().instantNotification();
         //   NotificationService().shedulePeriodicalNotification(DateTime.now(), "periodic succes", "11111");
            NotificationService().sheduleNotification(DateTime.now(), element.title,element.description);

          }
        }
     // }
    });

  //   for(DataList element in dataList){
  //      if(element.location != null && currentLocation != null) {
  //        double lat1 = element.location!.latitude;
  //        double lon1 = element.location!.longitude;
  //        double lat2 = currentLocation!.latitude;
  //        double lon2 = currentLocation!.longitude;
  //        print(element.location);
  //        print(currentLocation);
  //   // var p = 0.017453292519943295;
  //   // var c = cos;
  //   // var a = 0.5 - c((lat2 - lat1) * p)/2 +
  //   // c(lat1 * p) * c(lat2 * p) *
  //   // (1 - c((lon2 - lon1) * p))/2;
  //   // double distance = 12742 * asin(sqrt(a));
  //  double distance =  Geolocator.distanceBetween(lat1, lon1,lat2,lon2);
  //  dist = distance;
  //  notifyListeners();
  //  print("******************************++==++=********************");
  //
  //        print(distance);
  //  if(distance <= 100){
  //    NotificationService().instantNotification();
  //    print("**************************************************");
  //    print(distance);
  //    NotificationService().shedulePeriodicalNotification(DateTime.now(), "periodic succes", "Poliyeei");
  //    NotificationService().sheduleNotification(DateTime.now(), "scheduled success", "Poliyeei");
  //  }
  // }
  //     }
    }


  }
