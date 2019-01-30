import 'package:flutter/material.dart';
import 'package:my_first_app/list_element.dart';
import 'package:my_first_app/client_model.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_app/add_client_screen.dart';
import 'dart:async';
import 'dart:convert';
import 'package:my_first_app/database.dart';

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
      home: ClientsList()
      );
  }
}

class ClientsList extends StatefulWidget {
  @override
  _ClientsListState createState() => _ClientsListState();
}

class _ClientsListState extends State<ClientsList> {

@override
  Widget build(BuildContext context) {
  return Scaffold(
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
          ),
      floatingActionButton: MyFab()
    );
  }
}
//EXPLENATION WHY DOES IT WORK

//https://proandroiddev.com/a-deep-dive-into-floatingactionbutton-in-flutter-bf95bee11627
//https://stackoverflow.com/questions/44004451/navigator-operation-requested-with-a-context-that-does-not-include-a-navigator/51292613#51292613
class MyFab extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(context,
        MaterialPageRoute(
           builder: (context) => AddClientScreen()));
      }
    );
  }
}
          // return showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       // Retrieve the text the user has typed in using our
          //       // TextEditingController
          //       content: Text(myController.text),
          //     );
          //   },
          // )

Future<List<Client>> fetchObjects() async {
  try {
    final response = await DBProvider.db.getAllClients;
    return response;
  } on Exception {
    print(Exception);
  }
  // await http.get('http://www.mocky.io/v2/5c4175e20f00004b3fe7b7f2');
  // if (response.statusCode == 200) {
  //    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  //   return parsed.map<Client>((json) => Client.fromJson(json)).toList();
  // } else {
  //   // If that call was not successful, throw an error.
  //   throw Exception('Failed to load post');
  // }
}