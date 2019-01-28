import 'package:flutter/material.dart';
import 'package:my_first_app/list_element.dart';
import 'package:my_first_app/client_model.dart';
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
      home: Scaffold(
        appBar:  AppBar(
          title: Text("Some title"),
        ),
        body: FutureBuilder<List<Client>>(
          future: fetchObjects(),
          builder: (context, snapshot){
            if(snapshot.hasError) print(snapshot.error);
            return snapshot.hasData ?
                ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListElement(snapshot.data[index]);
                  }
                ) : Center(child: CircularProgressIndicator());
          },
        )
        ),
      );
  }
}


Future<List<Client>> fetchObjects() async {
  final response =
  await http.get('http://www.mocky.io/v2/5c4175e20f00004b3fe7b7f2');
  if (response.statusCode == 200) {
     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Client>((json) => Client.fromJson(json)).toList();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}