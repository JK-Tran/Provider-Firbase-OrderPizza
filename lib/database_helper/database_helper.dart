import 'dart:io';
import 'package:delivery_food/models/users.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const databaseName = 'delivery_food.db';

  Future<Database> initDB() async {
    // final databasePath = await getDatabasesPath();
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String path = join(dataDirectory.path, databaseName);
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
      await db.execute(receipts);
      await db.execute(bill);

    });
  }

  //create table Users
  String users = "CREATE TABLE IF NOT EXISTS users("
      "usrID INTEGER PRIMARY KEY AUTOINCREMENT,"
      "usrFullName TEXT,"
      "usrEmail CHAR(128) UNIQUE,"
      "usrPassword TEXT)";

  String bill = "CREATE TABLE IF NOT EXISTS bills(id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "billname TEXT)";

  //create table Users
  String receipts = "CREATE TABLE IF NOT EXISTS Receipts("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "date TEXT, "
      "totalPrice REAL)";

  //CRUD
  //truy vấn select đăng nhập
  Future<bool> login(Users user) async{
    final Database db = await initDB();
    var result = await db.rawQuery(
        "select * from users where usrEmail = '${user.usrEmail}' "
            "and usrPassword = '${user.usrPassword}' ");
    if(result.isNotEmpty)
    {
      return true;
    }
    return false;
  }

  //truy vấn insert users
  Future<int>signup(Users users)async{
    final Database db = await initDB();

    return db.insert("users", users.toMap());
  }
  


}



