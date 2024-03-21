import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'model.dart';

class DB {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, "Notes.db"),
        onCreate: (database, version) async {
      await database.execute(
          'CREATE TABLE Note(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,age TEXT NOT NULL,number TEXT NOT NULL,gender TEXT NOT NULL)');
    }, version: 1);
  }

  Future<bool> insertData(DataModel dataModel) async {
    final Database db = await initDB();
    db.insert("Note", dataModel.toMap());
    return true;
  }

  Future<List<DataModel>> getData() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> data = await db.query("Note");
    return data.map((e) => DataModel.formMap(e)).toList();
  }

  Future<void> updateNote(DataModel dataModel, int id) async {
    final Database db = await initDB();
    await db.update("Note", dataModel.toMap(), where: "id=?", whereArgs: [id]);
  }

  Future<void> deleteNote(int id) async {
    final Database db = await initDB();
    await db.delete("Note", where: "id=?", whereArgs: [id]);
  }
}
