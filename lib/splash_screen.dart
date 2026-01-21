import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_list_app/main.dart';
import 'package:movie_list_app/my_movie_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    super.initState();
    whereWeGO();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color:Theme.of(context).colorScheme.onSecondary,
        child: Center(child: Row(
          mainAxisAlignment: .center,
          children: [
            Icon(Icons.movie, color: Colors.red,),
            Text("Movie List".toUpperCase() ,style: TextStyle(fontSize: 30, fontWeight: .w700 ,color: Colors.red , fontStyle: .italic ),),
          ],
        )),
      ),
    );
  }
  
  void whereWeGO() {
    Timer(Duration(seconds: 2), (){
      if(!mounted) return;

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyMoviePage(title: "Movie List")));
    });
  }
}