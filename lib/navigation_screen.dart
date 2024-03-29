import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_todo/Screens/home_screen.dart';
import 'package:go_todo/Screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'Services/state_management.dart';

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

              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                  child: const Text("Login")
              ),
              TextButton(onPressed: () {
                final user = FirebaseAuth.instance.currentUser;
                if(user == null) {
                  Navigator.pushNamed(context, '/login');
                }
                else {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
              }
                }
                , child: Text("Home",

              ),),
              TextButton(onPressed: (){
                // await provider1.getTodoList();
                Navigator.pushNamed(context, '/task');
              }, child: Text("addtask")),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                  child: Text("settings")),
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
