import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// 定义数据模型类
class User {
  int? id;
  String? name;
  int? age;

  User({required this.id, required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id ?? "",
      'name': name ?? "",
      'age': age ?? "",
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      age: map['age'] ?? "",
    );
  }
}

class DatabaseHelper {
  late Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'supernote.db');

    // 创建数据库并定义数据表结构
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS User (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age INTEGER
      )
    ''');
  }

  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert('User', user.toMap());
  }

  Future<List<User>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('User');

    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }
}
