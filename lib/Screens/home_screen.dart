import 'package:flutter/material.dart';

import 'package:go_todo/Widgets/SideMenu.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(

      //leading: IconButton(onPressed: ()=>NavDrawer(), icon: Icon(Icons.menu)),

        title: Text("GO-TODO") ,
        actions: [
          Icon(Icons.search)
        ],
      ),
      body: SafeArea(child: Container()),
    );
  }
}
