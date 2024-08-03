import 'package:money_expense/src/features/expense/domain/expense.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      'expenses.db',
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE expenses (
        id INTEGER PRIMARY KEY,
        name TEXT,
        category TEXT,
        date TEXT,
        amount INTEGER
      )
    ''');
  }

  Future<int> insertExpense(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('expenses', row);
  }

  Future<List<Expense>> queryAllExpenses() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('expenses');
    return List.generate(maps.length, (i) {
      return Expense.fromMap(maps[i]);
    });
  }

  Future<int> updateExpense(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('expenses', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteExpense(int id) async {
    Database db = await database;
    return await db.delete('expenses', where: 'id = ?', whereArgs: [id]);
  }
}
