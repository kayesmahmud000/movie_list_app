import 'package:flutter/material.dart';
import 'package:movie_list_app/handle_movie_field.dart';
import 'package:movie_list_app/model/movie_model.dart';
import 'package:movie_list_app/model/wishlist_model.dart';
import 'package:movie_list_app/provider/movie_provider.dart';
import 'package:movie_list_app/provider/wishlist_provider.dart';
import 'package:movie_list_app/settings_page.dart';
import 'package:movie_list_app/wish_list.dart';
import 'package:provider/provider.dart';

class MyMoviePage extends StatefulWidget {
  const MyMoviePage({super.key,  required this.title});

 final String title;

  @override
  State<MyMoviePage> createState() => _MyMoviePageState();
}

class _MyMoviePageState extends State<MyMoviePage> {

@override
  void initState() {
    super.initState();
    context.read<MovieProvider>().getInitialMovie();
    context.read<WishlistProvider>().getInitialWishlist();
  }


void handleWishlist(String title) {
  final wishlistProvider = context.read<WishlistProvider>();

 bool isWishlisted = wishlistProvider.wishList.any((w) => w.movieTile == title);

    if (isWishlisted) {
      // Find the item and delete by ID (assuming your model has slNo)
      final item = wishlistProvider.wishList.firstWhere((w) => w.movieTile == title);
      if (item.slNo != null) {
        wishlistProvider.removeFromWishlist(item.slNo!);
      }
    } else {
      wishlistProvider.addToWishlist(WishlistModel(movieTile: title));
    }
}

@override
  Widget build(BuildContext context) {

          final wishlistItems = context.watch<WishlistProvider>().wishList;
          
     return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.error,
       
        title: Text(widget.title, style: TextStyle(fontSize: 30, fontWeight: .w700 ,color: Colors.white),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const WishList())),
                  child: Row(
                    children: [
                      Text('${wishlistItems.length}', style: const TextStyle(fontSize: 20, color: Colors.white)),
                      const SizedBox(width: 5),
                      const Icon(Icons.favorite, color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage())),
                  child: const Icon(Icons.more_vert, color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    body: Consumer<MovieProvider>(builder: (ctx, provider, child) {
        // Now using MovieModel objects!
        List<MovieModel> allMovies = provider.movies;

        if (allMovies.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No Movie yet', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
                Text('Please click the plus button to add one', textAlign: TextAlign.center),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: allMovies.length,
          itemBuilder: (context, index) {
            final movie = allMovies[index];
            bool isWishlisted = wishlistItems.any((w) => w.movieTile == movie.movieTitle);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
                tileColor: Colors.red.shade100,
                leading: Text('${index + 1}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                title: Text(movie.movieTitle, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                subtitle: Text('Duration: ${movie.duration ?? "N/A"}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => handleWishlist(movie.movieTitle),
                      icon: Icon(Icons.favorite, color: isWishlisted ? Colors.red : Colors.grey),
                    ),
                    IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HandleMovieField(
                            isUpdate: true,
                            defaultTitle: movie.movieTitle,
                            defaultDuration: movie.duration!,
                            sl: movie.slNo!
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        if (movie.slNo != null) {
                          // provider.deleteMovie(movie.slNo!);
                        }
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
     floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HandleMovieField())), child: Icon(Icons.add),),
    );
  }
}