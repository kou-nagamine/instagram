import 'package:flutter/material.dart';
import '../main.dart';

class InsertText extends StatelessWidget{
  InsertText({super.key, required this.text});

  final String text;

  @override 
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
            color:Colors.white,
            border: Border.all(color: Colors.white, width: 1),
      ),
      child: SingleChildScrollView(
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child:Container(
          child:ExpandableText(text)
        )
      )
      )
    );
  }
}
