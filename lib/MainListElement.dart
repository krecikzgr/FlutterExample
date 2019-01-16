import 'package:flutter/material.dart';
import 'package:my_first_app/ModelClass.dart';
import 'package:my_first_app/DetailsScreen.dart';
//Brac
class MainListElement extends StatelessWidget {
  final MyModel item;


  MainListElement(this.item);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        leading: CircleAvatar(
          child: Text(item.title),
        ),
        title:  Text(item.title),
        subtitle: Text(item.description),
        onTap:() { Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(item),
        ),
        );
      },
    );
  }
}