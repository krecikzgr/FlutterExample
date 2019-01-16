import 'package:flutter/material.dart';
import 'package:my_first_app/MainListElement.dart';
import 'package:my_first_app/ModelClass.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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
        body: FutureBuilder<List<MyModel>>(
          future: fetchObjects(),
          builder: (context, snapshot) {
            if(snapshot.hasError) print(snapshot.error);
            return snapshot.hasData ? ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return MainListElement(snapshot.data[index]);
                },
              ): Center(child: CircularProgressIndicator());
          },
        )

        ),
      );
  }
}

Future<List<MyModel>> fetchObjects() async {
  final response =
      await http.get('http://www.mocky.io/v2/5c3fa9503500004e2fec3a25');

  if (response.statusCode == 200) {
     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
 
    return parsed.map<MyModel>((json) => MyModel.fromJson(json)).toList();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
