import 'package:flutter/material.dart';
import 'package:my_first_app/MainListElement.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      home: new Scaffold(
        //Important add the app bar to the Scaffold
        appBar: new AppBar(
          title: new Text("The title for app bar"),
        ),
        //Add the body of the layout
        body: 
         ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return MainListElement("title", "subtitle");
          }
        ),
        ),
      );
  }
}



