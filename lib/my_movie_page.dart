import 'package:flutter/material.dart';
import 'package:movie_list_app/db/db_helper.dart';
import 'package:movie_list_app/handle_movie_field.dart';
import 'package:movie_list_app/provider/movie_provider.dart';
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
  }

@override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.error,
       
        title: Text(widget.title, style: TextStyle(fontSize: 30, fontWeight: .w700 ,color: Colors.white),),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              child: Row(
                spacing: 10,
                children: [
                     InkWell(
                     onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => WishList(),)),
                    child: Icon(Icons.favorite , color: Colors.white,)),
                    InkWell(
                     onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => SettingsPage(),)),child:  Icon(Icons.more_vert, color: Colors.white,))
                ],
              ),
            ),
          )
           
          ],
        
      ),
      body: Consumer<MovieProvider>(builder:(context, value, child){
       List<Map<String, dynamic>> allMovies =value.getMovies();
       return allMovies.isNotEmpty? Padding(
         padding: const EdgeInsets.all(8.0),
         child: ListView.builder(
          itemCount: allMovies.length,
          itemBuilder:(
          context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: BeveledRectangleBorder(borderRadius: .circular(2)),
              tileColor: Colors.red.shade100,
              leading: Text('${index+1}',style: TextStyle(fontSize: 24, fontWeight: .w700)),
              title: Text('${allMovies[index][DbHelper.MOVIE_COLUMN_TITLE]}', style: TextStyle(fontSize: 26, fontWeight: .w700),),
              subtitle: Text('Duration : ${allMovies[index][DbHelper.MOVIE_COLUMN_DURATION]}', style: TextStyle(fontSize: 19, fontWeight: .w400)),
              trailing: Row(
                spacing: 10,
                mainAxisSize: .min,
                children: [
                  Icon(Icons.favorite , color: Colors.white,),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => HandleMovieField(isUpdate: true, defaultTitle:allMovies[index][DbHelper.MOVIE_COLUMN_TITLE] , defaultDuration: allMovies[index][DbHelper.MOVIE_COLUMN_DURATION], sl: allMovies[index][DbHelper.MOVIE_COLUMN_SL_NO]),)),
                    child: Icon(Icons.edit)),
                  IconButton(
                    onPressed: () => {
                      context.read<MovieProvider>().deleteMovie(allMovies[index][DbHelper.MOVIE_COLUMN_SL_NO])
                    },
                    icon: Icon(Icons.delete, color:Colors.red ,)),
                ],
              ),
                     
                     ),
          ),),
       ):Center(child: Column(
        mainAxisAlignment: .center,
         children: [
           Text('No Movie yat', style: TextStyle(fontSize:26 ,fontWeight: .w600),),
           Text('Please click the plus button and add your first movie', style: TextStyle(fontSize:20 ,fontWeight: .w400),),
         ],
       ));
      }),
     floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HandleMovieField())), child: Icon(Icons.add),),
    );
  }
}