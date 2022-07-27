import 'package:flutter/material.dart';
import 'package:go_todo/Services/background_location.dart';
import 'package:go_todo/Services/state_management.dart';
import 'package:provider/provider.dart';



class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BackGroundLocation provider1 = Provider.of<BackGroundLocation>(context);
    DataStateProvider provider2 = Provider.of<DataStateProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Current locaton : lat: ${provider1.currentLocation?.latitude} , lon : ${provider1.currentLocation?.longitude }"),
                Text("marked location : lat ${provider2.incompleted_Todolist[0].location?.latitude} lon ${provider2.incompleted_Todolist[0].location?.longitude} "),
                Text("distance : ${provider1.dist}")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
