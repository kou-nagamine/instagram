import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InsertImage extends StatelessWidget{
  InsertImage({super.key, required this.image});

  final String image;

  @override 
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 400.0,
          decoration: BoxDecoration(
            color:Color.fromARGB(255, 243, 237, 237),
            border: Border.all(color: Colors.white, width: 1),
          ),
          child:Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              child:FittedBox(
                child:SvgPicture.asset(
                  image,
                )
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          child:Row(
            children:[
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/heart.svg',
                    ),
                    SizedBox(width: 15),
                    SvgPicture.asset(
                      'assets/images/chat-bubble-empty.svg'
                    ),
                    SizedBox(width: 15),
                    SvgPicture.asset(
                      'assets/images/send-diagonal.svg'
                    ),
                    SizedBox(width: 250),
                    SvgPicture.asset(
                      'assets/images/bookmark.svg'
                    ),
                  ]
                )
              ),
            ]
          )
        )
      ],
    );
  }
}