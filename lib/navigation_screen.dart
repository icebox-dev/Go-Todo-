import 'package:flutter/material.dart';
import 'package:go_todo/Screens/home_screen.dart';


class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: (){}, child: Text("Login")),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              }
                , child: Text("Home",

              ),),
              TextButton(onPressed: (){}, child: Text("addtask")),
              TextButton(onPressed: (){}, child: Text("settings")),
              TextButton(onPressed: (){}, child: Text("Connection")),
              TextButton(onPressed: (){}, child: Text("about")),
              TextButton(onPressed: (){}, child: Text("others")),

            ],


          ),
        ),
      ),
    );
  }
}


//home,login,settings,addtask,connection,about,