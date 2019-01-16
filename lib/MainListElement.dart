import 'package:flutter/material.dart';

//Brac
class MainListElement extends StatelessWidget {
  final String title;
  final String subtitle;

  MainListElement(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        leading: CircleAvatar(
          child: Text(title),
        ),
        title:  Text(title),
        subtitle: Text(subtitle),
    );
  }
}