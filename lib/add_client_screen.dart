import 'package:flutter/material.dart';
import 'package:my_first_app/client_model.dart';
import 'package:my_first_app/Database.dart';

class AddClientScreen extends StatefulWidget {

  @override
  _AddClientScreenSate createState() => _AddClientScreenSate();
}

class _AddClientScreenSate extends State<AddClientScreen> {
  final clientNameController = TextEditingController();

  @override
  void dispose() {
    clientNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve Text Input"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration:  InputDecoration(
              hintText: 'Client Name'
            ),
            controller: clientNameController,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Client client = new Client(company: "testCompany",email: "test@email.com",name: "Name");
          await DBProvider.db.createClient(client);
          setState(() {
            
          });
        }
      ),
    );
  }
}