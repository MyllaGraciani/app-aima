import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbUtil {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'ciclos.db'),
        onCreate: (db, version) {
      return db.execute('CREATE TABLE sintomas ()');
    });
  }

  // static Future<void> insert(String table, Map<String, Object> data) {}
}
