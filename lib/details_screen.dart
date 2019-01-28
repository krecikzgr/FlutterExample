import 'package:flutter/material.dart';
import 'package:my_first_app/client_model.dart';


class DetailsScreen extends StatelessWidget {

  final Client item;

  // In the constructor, require a Todo
  DetailsScreen(this.item);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text("${item.name}"),
      ),
      body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${item.company}',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red
            ),
            ),
            Text('${item.name}'),
            Text('${item.email}')
          ],
        )
      )
    );
  }
}