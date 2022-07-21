import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_todo/Screens/loading_screen.dart';
import 'package:go_todo/StateManagement/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const CircleAvatar(
            radius: 85,
            child: Image(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    )
                  ]
              ),
              child: Card(
                child: TextButton(
                  child: const ListTile(
                    leading: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/images/google.png'),
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                          'Sign in with Google',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadingScreen()));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
