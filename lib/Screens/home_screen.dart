//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_todo/Screens/task_screen.dart';
import 'package:go_todo/Services/background_location.dart';
import 'package:go_todo/Services/state_management.dart';
import 'package:go_todo/Services/notification_service.dart';

import 'package:go_todo/Widgets/SideMenu.dart';
import 'package:provider/provider.dart';

import '../components/TodoCard.dart';
import 'package:go_todo/DataList.dart';
import 'package:go_todo/Services/state_management.dart';





class HomeScreen extends StatefulWidget {


  const HomeScreen({Key? key}) : super(key: key);

  static const String home = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  Icon searchIcon = Icon(Icons.search);
  Widget searchBar = Text("Connections");





  @override

  initState(){
    WidgetsFlutterBinding.ensureInitialized();
      Provider.of<NotificationService>(context, listen: false).initialize();


    super.initState();
    Provider.of<DataStateProvider>(context, listen: false).getTodoList();
      Provider.of<BackGroundLocation>(context,listen: false).backgroundLocationService();
        }



  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    DataStateProvider provider1 = Provider.of<DataStateProvider>(context);


    void getData(){
      provider1.getTodoList();
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(

        drawer: NavDrawer(),
        appBar: AppBar(

        //leading: IconButton(onPressed: ()=>NavDrawer(), icon: Icon(Icons.menu)),

          title: const Text("GO-TODO") ,
          actions: [
            IconButton(onPressed: (){
              provider1.getTodoList();
              setState((){
                if(searchIcon.icon == Icons.search){
                  searchIcon = Icon(Icons.clear);
                  searchBar = const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(

                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search..",
                        hintStyle: TextStyle(
                            color: Colors.white54
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    ),
                  );
                }
                else{
                  searchIcon = Icon(Icons.search);
                  searchBar = Text("Connections");
                }
              });
            }, icon: searchIcon)
          ],
        ),

        body: Container(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                const Center(
                  child: TabBar(

                    isScrollable: true,
                    labelColor: Colors.black54,
                    indicatorColor: Colors.transparent,

                    unselectedLabelColor: Colors.grey,
                    padding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    tabs: [
                      Icon(Icons.square,size: 10,),
                      Icon(Icons.square,size: 10,)
                    ],
                  ),
                ),
                Container(

                     height: queryData.size.height - 100,
                     //height of TabBarView
                    child: TabBarView(children: <Widget>[
                      IncompleteTasks(),
                      CompletedTasks(),
                    ])
                )
              ])
          ),
        ]),
      ),
    ),
      ));
  }
}


class IncompleteTasks extends StatelessWidget {

  const IncompleteTasks({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
     DataStateProvider provider1 = Provider.of<DataStateProvider>(context);
     NotificationService provider2 = Provider.of<NotificationService>(context);
    bool? taskCondition = false;
    // List todoList = <Widget>[
    //   TodoCard(taskCondition: taskCondition),
    //   TodoCard(taskCondition: taskCondition)
    // ];
    int index;




    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, TaskScreen.task_screen);
        //provider1.alarmTest();
      },
        child: Icon(Icons.add,size: 30,),
      ),

      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemBuilder: (BuildContext context,int index){
          List<DataList> lst1 = provider1.incompleted_Todolist;
         // for(int i = 0; i<provider1.incompleted_Todo;i++){

            return TodoCard(taskCondition: false, title: lst1[index].title , index: index, desc: lst1[index].description , priority: lst1[index].priority,);// ?? Center(child: const CupertinoActivityIndicator());
         // }
        },
          itemCount: provider1.incompleted_Todo,

        ),
      ),

    );

  }
}




class CompletedTasks extends StatelessWidget {

  CompletedTasks({Key? key}) ;

  @override

  bool? taskCondition = false;

  int count = 0;
  @override

  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    DataStateProvider provider1 = Provider.of<DataStateProvider>(context);
    // List todoList = <Widget>[
    //   TodoCard(taskCondition: taskCondition),
    //   TodoCard(taskCondition: taskCondition)
    // ];
    int index;
    return Scaffold(

      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(controller: scrollController ,itemBuilder: (BuildContext context,int index){
          //for(int i = 0; i<provider1.completed_Todo;i++){
          List<DataList> lst = provider1.completed_Todolist;
          // for(int i = 0; i<provider1.incompleted_Todo;i++){

          return TodoCard(taskCondition: true, title: lst[index].title , index: index, desc: lst[index].description , priority: lst[index].priority,);// ?? Center(child: const CupertinoActivityIndicator());
          // }
        },
          itemCount: provider1.completed_Todo,


        ),
      ),

    );

  }
}


