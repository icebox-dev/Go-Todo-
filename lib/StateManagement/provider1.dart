import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_todo/DataList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/TodoCard.dart';



class DataStateProvider extends ChangeNotifier{
  int count = 0;
  int radio_id = 1;
  String time = "";
  String date = "";
  List<DataList> _completed_list = [];
  List<DataList> _incompleted_list = [];

  void AddTask(String title , String description){
    DataList dataList = DataList();
    dataList.title = title;
    dataList.description = description;
    dataList.priority = radio_id;
    dataList.time = time;
    dataList.date = date;


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

   void saveTodoList() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('CompletedList', jsonEncode(_completed_list));
    prefs.setString('IncompletedList', jsonEncode(_incompleted_list));
    String? c_list = prefs.getString('CompletedList');
    print(c_list);
  }

  void getTodoList()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? c_list = preferences.getString('CompletedList');
    String? in_list = preferences.getString('IncompleteList');
    _completed_list = jsonDecode(c_list!) ?? [];
    _incompleted_list = jsonDecode(in_list!) ?? [];
  }


}

// void incompleteTask(int index){
//   completed_list.add(incompleted_list[index]);
//   incompleted_list.removeAt(index);
//   notifyListeners();
// }