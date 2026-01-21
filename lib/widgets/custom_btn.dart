import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String btnText;
  final VoidCallback callback;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  const CustomBtn({super.key, required this.btnText, this.bgColor, this.icon,  required this.callback, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          textStyle: textStyle,
          shape: RoundedRectangleBorder(borderRadius: .circular(2))
        ),
        onPressed: ()=> callback(), child: icon !=null? Row(
          mainAxisAlignment: .center,
          children: [
            icon!,
            Text(btnText, style: textStyle,),
          ],
        ):Text(btnText , style: textStyle,)),
    );
  }
}