import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'monage.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE customers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        imagePath TEXT,
        unpaidAmount REAL DEFAULT 0
      );
    ''');
    await db.execute('''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        customerId INTEGER,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        imagePath TEXT,
        createdAt TEXT,
        FOREIGN KEY (customerId) REFERENCES customers(id)
      );
    ''');
    await db.execute('CREATE INDEX idx_customer_name ON customers(name);');
    await db.execute('CREATE INDEX idx_order_customerId ON orders(customerId);');
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
