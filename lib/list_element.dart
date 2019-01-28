import 'package:flutter/material.dart';
import 'package:my_first_app/client_model.dart';
import 'package:my_first_app/details_screen.dart';

class ListElement extends StatelessWidget {
  final Client client;

  ListElement(this.client);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          child: Text(client.name.substring(0,1)),
        ),
        title:  Text(client.company),
        subtitle: Text(client.email),
        onTap: () { 
            Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(client)
            ),
          );
        }
    );
  }
}