import 'package:flutter/material.dart';
import 'package:instagram/main.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final images = [
    'assets/images/jeans.svg',
    'assets/images/skinny.svg',
    'assets/images/sweat.svg',
    'assets/images/jeans.svg',
    'assets/images/skinny.svg',
    'assets/images/sweat.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('マイページ')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        '7,041',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text('投稿'),
                      ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(
                        '4.6億',
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                     ),
                      Text('フォロワー'),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(
                        '99',
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                     ),
                      Text('フォロー'),
                    ],
                  ),
                ]
              ),
            ),
            GridView.count(
              shrinkWrap:true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: images.map((imageUrl){
                return InstagramPostItem(imageUrl: imageUrl);
              }).toList(),
              // children: [
              //   InstagramPostItem(imageUrl: 'assets/images/jeans.svg'),
              //   InstagramPostItem(imageUrl: 'assets/images/skinny.svg'),
              //   InstagramPostItem(imageUrl: 'assets/images/sweat.svg'),
              //   InstagramPostItem(imageUrl: 'assets/images/jeans.svg'),
              //   InstagramPostItem(imageUrl: 'assets/images/skinny.svg'),
              //   InstagramPostItem(imageUrl: 'assets/images/sweat.svg'),
              // ],
            ),
          ],
        ),
      ),
    );
  }
}