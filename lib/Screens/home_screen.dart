import 'package:flutter/material.dart';

import 'package:go_todo/Widgets/SideMenu.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Icon searchIcon = Icon(Icons.search);
  Widget searchBar = Text("Connections");
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(

        //leading: IconButton(onPressed: ()=>NavDrawer(), icon: Icon(Icons.menu)),

          title: Text("GO-TODO") ,
          actions: [
            IconButton(onPressed: (){
              setState((){
                if(this.searchIcon.icon == Icons.search){
                  this.searchIcon = Icon(Icons.clear);
                  this.searchBar = Padding(
                    padding: const EdgeInsets.all(8.0),
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
                  this.searchIcon = Icon(Icons.search);
                  this.searchBar = Text("Connections");
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
                Container(
                  child: Center(
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
                ),
                Container(

                     height: queryData.size.height - 100,
                     //height of TabBarView
                    child: TabBarView(children: <Widget>[
                      CompletedTasks(),
                      IncompleteTasks()
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
    return Scaffold(
      body:Column(
        children: [
          Text("COMPLETED"
              ),

          ListView(children: [

          ],)
        ],
      ),
    );
  }
}
class CompletedTasks extends StatefulWidget {
  CompletedTasks({Key? key}) ;

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  bool? taskCondition = false;


  @override

  Widget build(BuildContext context) {
    List todoList = <Widget>[
      TodoCard(taskCondition: taskCondition),
      TodoCard(taskCondition: taskCondition)
    ];
    int index;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemBuilder: (BuildContext context,int index){
           return TodoCard(taskCondition: taskCondition);
         },
         itemCount: 30,

         )
          ,
      ),

    );

  }
}

class TodoCard extends StatefulWidget {
  TodoCard({
    Key? key,
    required this.taskCondition,
  }) : super(key: key);

  late bool? taskCondition;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(

        leading:Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(color: Colors.greenAccent,
         borderRadius: BorderRadius.circular(10)
          ),
        ),
        title: Text("HomeWork"),
        subtitle: Text("do your home work"),
        trailing: Checkbox(
          onChanged: (val){
            setState((){
              widget.taskCondition = val;
            });

          }, value: widget.taskCondition,
        ),
      ),
    );
  }
}
