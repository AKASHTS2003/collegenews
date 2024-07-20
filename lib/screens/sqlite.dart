import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await _getDbPath();
    print('Database path: $path'); // Print the database path
    Database database =
        await openDatabase(path, version: 1, onCreate: _createDb);
    _createDb(database, 1); // Call _createDb function here
    print('Database initialized');
    return database;
  }

  Future<String> _getDbPath() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    return join(documentsDirectory.path, 'collegenews.db');
  }

  void _createDb(Database db, int version) async {
    try {
      await db.execute('''
        CREATE TABLE User (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          password TEXT
        )
        ''');

      await db.execute('''
        CREATE TABLE Reminders (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          notes TEXT,
          date TEXT
        )
        ''');

      await db.execute('''
        CREATE TABLE Images (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          path TEXT,
          description TEXT
        )
        ''');
      print('Tables created successfully.');
    } catch (e) {
      print('Error creating tables: $e');
      rethrow; // rethrow the exception after logging it
    }
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await instance.database;
    return await db.insert('User', user);
  }

  Future<Map<String, dynamic>?> getUser(String username) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query('User',
        where: 'username = ?', whereArgs: [username], limit: 1);
    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<int> insertReminder(Map<String, dynamic> reminder) async {
    Database db = await instance.database;
    return await db.insert('Reminders', reminder);
  }

  Future<List<Map<String, dynamic>>> getAllReminders() async {
    Database db = await instance.database;
    return await db.query('Reminders');
  }

  Future<int> deleteReminder(int id) async {
    Database db = await instance.database;
    return await db.delete('Reminders', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> insertImage(Map<String, dynamic> imageData) async {
    try {
      Database db = await instance.database;
      print('Inserting image data: $imageData');
      int result = await db.insert('Images', imageData);
      print('Image inserted with result: $result');
      return result;
    } catch (e) {
      print('Error inserting image: $e');
      rethrow; // rethrow the exception after logging it
    }
  }

  Future<List<Map<String, dynamic>>> getAllImages() async {
    Database db = await instance.database;
    return await db.query('Images');
  }

  Future<int> deleteImage(String path) async {
    Database db = await instance.database;
    return await db.delete('Images', where: 'path = ?', whereArgs: [path]);
  }
}
