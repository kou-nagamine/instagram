import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/widgets/image.dart';
import 'package:instagram/widgets/text.dart';
import '../widgets/accont.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});

  final List<List<String>> Posts = [
    ['assets/images/sweat.svg','ああああああああああああああああああああああああああああああああああああああああ','サンディエゴ'],
    ['assets/images/sweat.svg','aaaaaaaaaaaaaaaaaa','シカゴ'], 
    ['assets/images/sweat.svg','aaaaaaaaaaaaaaaaaa','ロサンゼルス'],
    ['assets/images/sweat.svg','aaaaaaaaaaaaaaaaaa','ニューヨーク'],
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('フィード')),
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: Posts.map((post) {
              return Column(
                children:[
                  AccountInfo(imageUrl: 'assets/images/sweat.svg', userName: post[2]),
                  SizedBox(height: 10),
                  InsertImage(image: post[0]),
                  InsertText(text: post[1])
                ]
              );
            }).toList(),
          )
      )
    );
  }
}