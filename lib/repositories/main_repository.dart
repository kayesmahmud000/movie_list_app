import "package:movie_list_app/db/db_helper.dart";


abstract class BaseRepository<T> {
  final DbHelper dbHelper = DbHelper.getInstance;
  
  String get tableName;

  T fromMap(Map<String, dynamic> map);

  Map<String, dynamic> toMap(T model);

  Future<List<T>> getAll() async {
    final db = await dbHelper.getDB();
    final List<Map<String, dynamic>> maps = await db.query(tableName);
   
    return maps.map((item) => fromMap(item)).toList();
  }

Future <Map<String, dynamic>> getMovieByTitle(String title )async{
  final db = await dbHelper.getDB();

  final List<Map<String, dynamic>> movieList = await db.query(tableName,  where: 'title =?', whereArgs: [title]);

  return movieList;
}
  Future<bool> insert(T model) async {
    final db = await dbHelper.getDB();
    int result = await db.insert(tableName, toMap(model));
    return result > 0;
  }

  Future<bool> delete(String column, int id) async {
    final db = await dbHelper.getDB();
    int result = await db.delete(
      tableName,
      where: "$column = ?",
      whereArgs: [id],
    );
    return result > 0;
  }
}