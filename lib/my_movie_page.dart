import 'package:flutter/material.dart';
import 'package:movie_list_app/add_movie_page.dart';
import 'package:movie_list_app/widgets/custom_btn.dart';

class MyMoviePage extends StatefulWidget {
  const MyMoviePage({super.key,  required this.title});

 final String title;

  @override
  State<MyMoviePage> createState() => _MyMoviePageState();
}

class _MyMoviePageState extends State<MyMoviePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.error,
       
        title: Text(widget.title, style: TextStyle(fontSize: 30, fontWeight: .w700 ,color: Colors.white),),
      ),
      body: Center(
       
        child: Column(
          
          mainAxisAlignment: .center,
          children: [
            const Text('All Movie list Hare'),
            CustomBtn(btnText: 'Add Movie', callback:()=>{})
          
          ],
        ),
      ),
     floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMoviePage())), child: Icon(Icons.add),),
    );
  }
}