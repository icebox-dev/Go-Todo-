import 'package:flutter/material.dart';


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
              TextButton(onPressed: (){}, child: Text("Home"),),
              TextButton(onPressed: (){}, child: Text("addtask")),
              TextButton(onPressed: (){}, child: Text("settings")),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, '/connections');
              }, child: Text("Connection")),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, '/about');
              }, child: Text("about")),
              TextButton(onPressed: (){}, child: Text("others")),
            ],
          ),
        ),
      ),
    );
  }
}


//home,login,settings,addtask,connection,about,