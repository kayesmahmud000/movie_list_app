import 'package:flutter/material.dart';
import 'package:movie_list_app/model/movie_model.dart';
import 'package:movie_list_app/repositories/movie_repository.dart';


class MovieProvider extends ChangeNotifier {
 
  final MovieRepository movieRepo;

  MovieProvider({required this.movieRepo});

  
  List<MovieModel> _movieList = [];

  List<MovieModel> get movies => _movieList;


  void getInitialMovie() async {
    _movieList = await movieRepo.getAll();
    notifyListeners();
  }

}


// class MovieProvider extends ChangeNotifier{
//   DbHelper dbHelper;

// MovieProvider({required this.dbHelper});

//   List<Map<String, dynamic >> _movieList=[];

// // add movies
//   void addMovie (MovieModel movie) async{
//   bool check= await  dbHelper.addMovie(movie);

//   if(check){
//     _movieList = await dbHelper.getMovies();
//     notifyListeners();
//   }

//   }


  // void addMovie(MovieModel movie) async {
  //   bool check = await movieRepo.insert(movie);

  //   if (check) {
  //     _movieList = await movieRepo.getAll();
  //     notifyListeners();
  //   }
  // }

  // // Update movie
  // void updateMovie(MovieModel movie, int sl) async {
  //   // Calling the specific update method we defined in the MovieRepository
  //   bool check = await movieRepo.updateMovie(movie, sl);

  //   if (check) {
  //     _movieList = await movieRepo.getAll();
  //     notifyListeners();
  //   }
  // }

  // // Delete movie
  // void deleteMovie(int sl) async {
  //   // Using the generic delete from the BaseRepository via MovieRepository
  //   bool check = await movieRepo.delete(DbHelper.MOVIE_COLUMN_SL_NO, sl);

  //   if (check) {
  //     _movieList = await movieRepo.getAll();
  //     notifyListeners();
  //   }
  // }

// // get movies
// List<Map<String ,dynamic>> getMovies()=>_movieList;

// // get initial movies
// void getInitialMovie()async{
//   _movieList = await dbHelper.getMovies();
//   notifyListeners();
// }

// // update movies
//   void updateMovie (MovieModel movie, int sl) async{
//   bool check= await  dbHelper.updateMovie(movie, sl);

//   if(check){
//     _movieList = await dbHelper.getMovies();
//     notifyListeners();
//   }

//   }

// void deleteMovie (int sl) async{
//   bool check = await dbHelper.deleteMovie(sl);

//   if(check){
//     _movieList = await dbHelper.getMovies();
//     notifyListeners();
//   }
// }
// }