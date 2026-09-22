import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'iis_app.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE featured_album (
            id TEXT PRIMARY KEY,
            title TEXT,
            artist TEXT,
            description TEXT,
            audioUrl TEXT,
            durationLabel TEXT,
            repetitionsLabel TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE popular_meditations (
            id TEXT PRIMARY KEY,
            title TEXT,
            author TEXT,
            durationLabel TEXT,
            audioUrl TEXT,
            colorTag TEXT
          )
        ''');
      },
    );
  }
}
