import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_todo/DataList.dart';
import 'package:go_todo/Screens/task_screen.dart';
import 'package:go_todo/Services/notification_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/TodoCard.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';



class DataStateProvider extends ChangeNotifier{
  int count = 0;
  int radio_id = 1;
  LatLng? location;
  String time = "";
  String date = "";
  DateTime? dateTime;
  List<DataList> _completed_list = [];
  List<DataList> _incompleted_list = [];

  late SharedPreferences pref;

  void AddTask(String title , String description){
    DataList dataList = DataList();
    dataList.title = title;
    dataList.description = description;
    dataList.priority = radio_id;
    dataList.time = time;
    dataList.date = date;
    dataList.id = DateTime.now().millisecondsSinceEpoch;
    dataList.dateTime = dateTime;
    dataList.location = location;
    if(dateTime != null){
      NotificationService().sheduleNotification(dateTime!,title,description);
    }



    _incompleted_list.add(dataList);
    radio_id = 1;
    date = "";
    time = "";
    notifyListeners();
  }

  void completeTask(int index){
    DataList dataList = _incompleted_list[index];
    _completed_list.add(dataList);
    _incompleted_list.removeAt(index);

    notifyListeners();
  }


  int get completed_Todo {
    return _completed_list.length;
  }

  UnmodifiableListView<DataList> get completed_Todolist {
    return UnmodifiableListView(_completed_list);
  }

  int get incompleted_Todo {
    return _incompleted_list.length;
  }

  UnmodifiableListView<DataList> get incompleted_Todolist {
    return UnmodifiableListView(_incompleted_list);
  }

  void priority_change(int val){
    radio_id = val;
    notifyListeners();
  }

  void setTime(String vTime){
    time = vTime;
    notifyListeners();
  }
  void setDate(String vDate){
    date = vDate;
    notifyListeners();
  }
  void setDateTime(DateTime vDateTime){
    dateTime = vDateTime;
    notifyListeners();
  }

  void cancel(){
    date = "";
    time = "";
    radio_id = 1;
  }

 // saveTodoList() async {
 //    final SharedPreferences preferences = await SharedPreferences.getInstance();
 //    String encodedData = json.encode(_completed_list);
 //
 //    await preferences.setString("completed_list", encodedData);
 // }

   saveTodoList() async {
     List completedLocalData = [];
     List incompletedLocalData = [];

    pref = await SharedPreferences.getInstance();
    
    // var string = _completed_list.map((e) => e.toJson()).toList()).toList();

    for(var j in _incompleted_list){
      print(j.title);
      incompletedLocalData.add(
          {
            "id" : j.id,
            "title" : j.title,
            "description" : j.description,
            "priority" : j.priority,
            "date" : j.date,
            "time" : j.time
          }
      );
    }
    for(var j in _completed_list){
      print(j.title);
      completedLocalData.add(
          {
            "id" : j.id,
            "title" : j.title,
            "description" : j.description,
            "priority" : j.priority,
            "date" : j.date,
            "time" : j.time
          }
      );
    }
    pref.setString('IncompleteList', jsonEncode(incompletedLocalData));
    pref.setString('CompleteList', jsonEncode(completedLocalData));
    print("Todo Saved Sucesfully _-----------------------------------------_____________________---------------------__________--------");
    print(completedLocalData);
    notifyListeners();
  }

  getTodoList()async{
    List<DataList> _completed_list = [];
    List<DataList> _incompleted_list = [];
    pref = await SharedPreferences.getInstance();
    String? stringIncompleted = pref.getString("IncompleteList");
    String? stringCompleted = pref.getString("CompleteList");
    if(stringIncompleted != null){
      List listIn = jsonDecode(stringIncompleted) ?? [];
      for(var jsonData in listIn){
        _incompleted_list.add(fromJson(jsonData));
      }
    }
    if(stringCompleted != null){
      List listC = jsonDecode(stringCompleted) ?? [];
      for(var jsonData in listC){
        _completed_list.add(fromJson(jsonData));
      }
    }

    notifyListeners();

  }


  // dynamic toJson(String jTitle, String jDescription , int jPriority, String jDate , String jTime ){
  //   print(jTitle);
  //     return {
  //       "title" : jTitle,
  //       "description" : jDescription,
  //       "priority" : jPriority,
  //       "date" : jDate,
  //       "time" : jTime
  //     };
  // }
  DataList fromJson(jsonData){
    DataList dataList = DataList();
    dataList.title = jsonData["title"];
    dataList.description = jsonData["description"];
    dataList.priority = jsonData["priority"];
    dataList.date = jsonData["date"];
    dataList.time = jsonData["time"];
    dataList.id = jsonData["id"];
    dataList.dateTime = jsonData["dateTime"];
    return dataList;
  }


  void setLatLong(LatLng latLng){
      location = latLng;
      notifyListeners();
  }


  // alarmTest(){
  //   AndroidAlarmManager.oneShot(Duration(seconds: 10), 20,NotificationService().instantNotification,alarmClock: true );
  //   print(DateTime.now());
  // }

}
  void fireAlarm (){
  print("Alarm fired");
  }


