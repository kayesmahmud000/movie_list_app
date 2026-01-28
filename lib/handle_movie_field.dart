import 'package:flutter/material.dart';
import 'package:movie_list_app/model/movie_model.dart';
import 'package:movie_list_app/provider/movie_provider.dart';
import 'package:movie_list_app/widgets/custom_btn.dart';
import 'package:provider/provider.dart';

class HandleMovieField extends StatefulWidget {
  final bool isUpdate ;
  final String defaultTitle;
  final String defaultDuration;
  final int sl;
  const HandleMovieField({super.key, this.isUpdate=false, this.defaultTitle='', this.defaultDuration='', this.sl=0 });


  @override
  State<HandleMovieField> createState() => _HandleMovieFieldState();
}

class _HandleMovieFieldState extends State<HandleMovieField> {
  TextEditingController titleController =TextEditingController();
  TextEditingController durationController =TextEditingController();

@override
  void initState() {
    super.initState();
   if(widget.isUpdate){
    titleController.text =widget.defaultTitle;
    durationController.text = widget.defaultDuration;
   }
  }

final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

// void handleMovie(){

//   if(!_formKey.currentState!.validate()){
//     return;
//   }

// String title = titleController.text;
// String duration = durationController.text;

// if( title.isEmpty && duration.isEmpty) return;

// MovieModel movieModel =MovieModel(
//   movieTitle: title, 
//   duration: duration
//   );

// if(widget.isUpdate){
//   context.read<MovieProvider>().updateMovie(movieModel, widget.sl);
// }else{
//  context.read<MovieProvider>().addMovie(movieModel);
// }
//   titleController.clear();
//   durationController.clear();

//   Navigator.pop(context);
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        title: Text(widget.isUpdate?"Update Movie":"Add  New Movie",  style: TextStyle(fontSize: 30, fontWeight: .w700 ,color: Colors.white)),),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: .center,
              children: [TextFormField(
                controller: titleController ,
                decoration: InputDecoration(filled: true, fillColor:Colors.white, label: Text('Movie Title')
                ,hintText: "Enter Movie Title"),
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'Movie title is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 21,),
              TextFormField(
                controller: durationController ,
                decoration: InputDecoration(filled: true, fillColor:Colors.white, label: Text('Movie Duration')
                ,hintText: "Enter Movie Duration"),
                validator:(value){
                  if(value == null || value.trim().isEmpty){
                    return 'Movie duration is required';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  CustomBtn(btnText: widget.isUpdate?"Update Movie":"Add Movie", callback: (){
                    
                    // handleMovie()

                  }, bgColor: Colors.green, textStyle: TextStyle(color: Colors.white , fontSize: 18, fontWeight: .w600) ,),
                  
                  CustomBtn(btnText: "Cancel", callback:()=>{
                    Navigator.pop(context)
                  },  bgColor: Colors.red, textStyle: TextStyle(color: Colors.white , fontSize: 18, fontWeight: .w600))
                ],
              )
              ],
            ),
          ),
        )
      ),
    );
  }
}