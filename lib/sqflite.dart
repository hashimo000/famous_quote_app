import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DbProvider{
  static Database? database;
  static final String tableName ="alarm";

  static Future<void>_createTable(Database db ,int version)async{

 await db.execute("CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT ,alarm_time TEXT,isactive INTENGER)");
}
static Future<Database> initDb() async{
  String path = join(await getDatabasesPath(),"alarm_app.db");
  return await openDatabase(path, version:1,onCreate:_createTable);
}

static Future<Database?> setDb()async{
  if(database == null){
    database= await initDb();
    return database;
  }else{
    return database;
  }
}
}