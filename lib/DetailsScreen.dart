import 'package:flutter/material.dart';
import 'package:my_first_app/ModelClass.dart';


class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final MyModel item;

  // In the constructor, require a Todo
  DetailScreen(this.item);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text("${item.title}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${item.description}'),
      ),
    );
  }
}