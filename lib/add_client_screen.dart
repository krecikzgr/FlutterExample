import 'package:flutter/material.dart';
import 'package:my_first_app/client_model.dart';


class AddClientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new element screen"),
      ),
      body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Details Screen',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red
            ),
            ),
          ],
        )
      )
    );
  }
}