import 'package:flutter/material.dart';
import 'package:movie_list_app/db/db_helper.dart';
import 'package:movie_list_app/model/movie_model.dart';

class MovieProvider extends ChangeNotifier{
  DbHelper dbHelper;

MovieProvider({required this.dbHelper});

  List<Map<String, dynamic >> _movieList=[];

// add movies
  void addMovie (MovieModel movie) async{
  bool check= await  dbHelper.addMovie(movie);

  if(check){
    _movieList = await dbHelper.getMovies();
    notifyListeners();
  }

  }

// get movies
List<Map<String ,dynamic>> getMovies()=>_movieList;

// get initial movies
void getInitialMovie()async{
  _movieList = await dbHelper.getMovies();
  notifyListeners();
}

// update movies
  void updateMovie (MovieModel movie, int sl) async{
  bool check= await  dbHelper.updateMovie(movie, sl);

  if(check){
    _movieList = await dbHelper.getMovies();
    notifyListeners();
  }

  }

void deleteMovie (int sl) async{
  bool check = await dbHelper.deleteMovie(sl);

  if(check){
    _movieList = await dbHelper.getMovies();
    notifyListeners();
  }
}
}