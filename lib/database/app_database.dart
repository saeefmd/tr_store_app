import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as paths;
import 'package:tr_store_app/database/database_info.dart';
import 'package:tr_store_app/database/sql_scripts.dart';

class AppDatabase {

  static Future<Database> open() async {

    var path = await getDatabasesPath();
    var databasePath = paths.join(path, DatabaseInfo.databaseName);

    var database = await openDatabase(databasePath,
        version: DatabaseInfo.databaseVersion,
        onCreate: (Database db, int version) async {
          await db.execute(SqlScripts.createCartTable);
        });

    return database;
  }
}