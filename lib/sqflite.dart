import 'package:sqflite/sqflite.dart';

class DbProvider{
  static Database? database;
  static final String tableName ="alarm";

  static Future<void>_createTable(Database db ,int version)async{

 await db.execute("CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT ,alarm_time TEXT,is_active INTEGER)");
}
}