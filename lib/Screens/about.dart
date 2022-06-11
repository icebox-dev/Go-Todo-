import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        titleSpacing: 0.0,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(child: Container(
                child: Icon(Icons.person),
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
              ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
              child: Text("Version",style: TextStyle(color: Colors.blueAccent,fontSize: 15),),
            ),
            Container(
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Terms of Use & Privacy Policy",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 15,),
                    Text("Open sourse licenses",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                      Text("Version",style: TextStyle(fontSize: 20),),
                      Padding(padding: const EdgeInsets.only(left: 2),child: Text("1.0.0",style: TextStyle(fontSize: 14,fontStyle: FontStyle.italic),),)
                    ],)
                  ],
                ),
              ),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
              color: Colors.blue[100],
            ),
            )

          ],
        ),
      ),
    );
  }
}
