import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:my_first_app/client_model.dart';


class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if( _database != null)
    return _database;

    _database = await initDB();
    return _database;
  }

initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Client ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name TEXT,"
          "email TEXT,"
          "company TEXT"
          ")");
    });
  }

  createClient(Client newClient) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");
    int id = table.first["id"];
    //insert to the table using the new id 
    var raw = await db.rawInsert(
        "INSERT Into Client (id, name, email, company)"
        " VALUES (?,?,?,?)",
        [id, newClient.name, newClient.email, newClient.company]);
    return raw;
  }

  getAllClients() async {
    final db = await database;
    var res = await db.query("Client");
    List<Client> list =  res.isNotEmpty ? res.map((client)=>Client.fromJson(client)).toList() : [];
    return list;
  }

  deleteClient(int id) async {
    final db = await database;
    var res = db.delete("Client",where: "id = ?", whereArgs: [id]);
    return res;
  }
}