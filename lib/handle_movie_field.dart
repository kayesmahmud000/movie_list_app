import 'package:flutter/material.dart';
import 'package:movie_list_app/widgets/custom_btn.dart';

class HandleMovieField extends StatefulWidget {
  const HandleMovieField({super.key});

  @override
  State<HandleMovieField> createState() => _HandleMovieFieldState();
}

class _HandleMovieFieldState extends State<HandleMovieField> {
  TextEditingController titleController =TextEditingController();
  TextEditingController durationController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Form(
          child: Column(
            mainAxisAlignment: .center,
            children: [TextField(
              controller: titleController ,
              decoration: InputDecoration(filled: true, fillColor:Colors.white, label: Text('Movie Title')
              ,hintText: "Enter Movie Title"),
            ),
            SizedBox(height: 21,),
            TextField(
              controller: durationController ,
              decoration: InputDecoration(filled: true, fillColor:Colors.white, label: Text('Movie Duration')
              ,hintText: "Enter Movie Duration"),
            ),
            Row(
              mainAxisAlignment: .spaceAround,
              children: [
                CustomBtn(btnText: "Add Movie", callback: ()=>{}, bgColor: Colors.green, textStyle: TextStyle(color: Colors.white , fontSize: 18, fontWeight: .w600) ,),
                
                CustomBtn(btnText: "Cancel", callback:()=>{
                  Navigator.pop(context)
                },  bgColor: Colors.red, textStyle: TextStyle(color: Colors.white , fontSize: 18, fontWeight: .w600))
              ],
            )
            ],
          ),
        ),
      )
    );
  }
}