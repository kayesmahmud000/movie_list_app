import 'dart:io';

import 'package:movie_list_app/model/movie_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static final DbHelper getInstance = DbHelper._();
  static final TABLE_MOVIE='movie';
  static final MOVIE_COLUMN_SL_NO='sl_no';
  static final MOVIE_COLUMN_TITLE='title';
  static final MOVIE_COLUMN_DURATION='duration';
  

  Database? myDB;

  Future<Database> getDB()async{
    myDB ??= await openDB();
    return myDB!;
    }

  Future<Database> openDB()async{
    Directory directory =await getApplicationDocumentsDirectory();

    String dbPath = join(directory.path, 'movieDB.db');

    return await openDatabase(dbPath, onCreate: (db, version) =>db.execute('create table $TABLE_MOVIE ($MOVIE_COLUMN_SL_NO integer primary key autoincrement, $MOVIE_COLUMN_TITLE text , $MOVIE_COLUMN_DURATION text) '), version: 1);
    
  }  

  //queries

  // insertion
  Future<bool> addMovie (MovieModel movie) async{
    var db = await getDB();

   int rowEffect = await db.insert(TABLE_MOVIE, {
      MOVIE_COLUMN_TITLE:movie.movieTitle,
     MOVIE_COLUMN_DURATION: movie.duration
    });
    return rowEffect>0;
  }

Future<List<Map<String, dynamic>>> getMovies() async{
  var db = await getDB();

  List<Map<String, dynamic>> movieData = await db.query(TABLE_MOVIE);
  return movieData;
}

Future<bool> updateMovie (MovieModel movie, int sl) async{
  var db = await getDB();

int rowEffect = await db.update(TABLE_MOVIE, {
  MOVIE_COLUMN_TITLE: movie.movieTitle,
  MOVIE_COLUMN_DURATION:movie.duration
}, where:"$MOVIE_COLUMN_SL_NO = $sl");

 return rowEffect>0;
}

Future<bool> deleteMovie(int sl) async{
var db =await getDB();
int rowEffect =await db.delete(TABLE_MOVIE, where: "$MOVIE_COLUMN_SL_NO =?", whereArgs: ['$sl']);

return rowEffect>0;
}
}