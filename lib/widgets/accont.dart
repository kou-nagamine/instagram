
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountInfo extends StatelessWidget{
  AccountInfo({super.key, required this.imageUrl, required this.userName});
  final String imageUrl;
  final String userName;

  @override
  Widget build (BuildContext context){
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
            child: ClipOval(
              child: Container(
                width: 70,
                height: 70,
                color: Colors.blue,
                child:SvgPicture.asset(
                  imageUrl,
                  fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(width:10),
        Column(
          children: [
            Text(
              'instagram',
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              )
            ),
            Text(userName)
          ],
        ) 
      ]
    );
  }
}


