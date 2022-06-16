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
    return Container(
      child: Text("COMPLETED"
          ),
    );
  }
}
class CompletedTasks extends StatelessWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      body:Container(
    child: Text("TODO"
    ),
      )
    );

  }
}
