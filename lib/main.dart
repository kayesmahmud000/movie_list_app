import 'package:flutter/material.dart';
import 'package:movie_list_app/db/db_helper.dart';
import 'package:movie_list_app/provider/movie_provider.dart';
import 'package:movie_list_app/provider/theme_provider.dart';
import 'package:movie_list_app/provider/wishlist_provider.dart';
import 'package:movie_list_app/repositories/movie_repository.dart';
import 'package:movie_list_app/repositories/wishlist_repository.dart';
import 'package:movie_list_app/splash_screen.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context)=>MovieProvider(dbHelper: DbHelper.getInstance)),
//   ChangeNotifierProvider(create:(context) => ThemeProvider(),),
//   ChangeNotifierProvider(create:(context) => WishlistProvider(dbHelper: DbHelper.getInstance),)
//   ],
//   child: MyApp()) , );
// }

void main() {
  runApp(
    MultiProvider(
      providers: [
        
        Provider(create: (_) => MovieRepository()),
        Provider(create: (_) => WishlistRepository()),

        ChangeNotifierProvider(
          create: (context) => MovieProvider(
            movieRepo: context.read<MovieRepository>(),
          )..getInitialMovie(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(
            
            wishlistRepo: context.read<WishlistRepository>(), 
          )..getInitialWishlist(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<ThemeProvider>().getThemeMode()? ThemeMode.dark: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.red),
      ),
      home: const SplashScreen(),
    );
  }
}
