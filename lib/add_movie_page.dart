import 'package:flutter/material.dart';
import 'package:movie_list_app/handle_movie_field.dart';

class AddMoviePage extends StatefulWidget {
  const AddMoviePage({super.key});

  @override
  State<AddMoviePage> createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        title: Text("Add  New Movie",  style: TextStyle(fontSize: 30, fontWeight: .w700 ,color: Colors.white)),),
        body: HandleMovieField(),
    );
  }
}