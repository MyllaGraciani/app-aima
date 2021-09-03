import 'package:aima/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _database;

  static final _databaseName = "aima_banco";
  static final _databaseVersion = 1;

  // torna esta classe singleton
  Connection._privateConstructor();
  static final Connection instance = Connection._privateConstructor();

  Future<Database?> get() async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(createTable1);
    await db.execute(createTable2);
    await db.execute(createTable3);
    await db.execute(createTable4);
    for (int i = 0; i < listInsert.length; i++) {
      await db.execute(listInsert[i]);
    }
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database? _db = await instance.get();

    return await _db!.query(table);
  }
}
