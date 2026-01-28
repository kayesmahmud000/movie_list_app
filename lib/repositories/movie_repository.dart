import 'package:movie_list_app/db/db_helper.dart';
import 'package:movie_list_app/model/movie_model.dart';
import 'package:movie_list_app/repositories/main_repository.dart';

class MovieRepository extends BaseRepository<MovieModel> {
  @override
  String get tableName => DbHelper.TABLE_MOVIE;

  @override
  MovieModel fromMap(Map<String, dynamic> map) => MovieModel.fromMap(map);

  @override
  Map<String, dynamic> toMap(MovieModel model) => model.toMap();

  // Specific logic only: Update is usually specific to the model
  Future<bool> updateMovie(MovieModel movie, int sl) async {
    final db = await dbHelper.getDB();
    int result = await db.update(
      tableName,
      toMap(movie),
      where: "${DbHelper.MOVIE_COLUMN_SL_NO} = ?",
      whereArgs: [sl],
    );
    return result > 0;
  }
}