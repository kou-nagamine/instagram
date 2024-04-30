import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../pages/feed_page.dart';
import '../pages/my_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final _pageWidgets = [
    FeedPage(key:UniqueKey()),
    MyPage(key:UniqueKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
         items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'フィード'),//index 0
           BottomNavigationBarItem(icon: Icon(Icons.person), label:'マイページ'),//index 1
         ],
         currentIndex: _currentIndex,
         onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState((){
      _currentIndex = index;
    });
  }
}

class InstagramPostItem extends StatelessWidget {
  const InstagramPostItem({super.key, required this.imageUrl});
  
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imageUrl,
      fit:BoxFit.cover,
    );
  }
}

class ExpandableText extends StatefulWidget { 

 const ExpandableText(
    this.data, {
      Key? key,
      this.maxLines = 1,
      this.textOverflow = TextOverflow.fade,
      this.style,
    }
  ): super(key: key);

  final String data;
  final int maxLines;
  final TextOverflow textOverflow;
  final TextStyle? style;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>{
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final textStyle = widget.style ?? DefaultTextStyle.of(context).style;
      final textSpan = TextSpan(text: widget.data, style: textStyle);
      final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr, maxLines: widget.maxLines);

      textPainter.layout(maxWidth: constraints.maxWidth);

      if (textPainter.didExceedMaxLines) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.data,
              style: textStyle,
              overflow: widget.textOverflow,
              maxLines: _isExpanded ? null : widget.maxLines,
            ),
            const SizedBox(height: 4.0,),
            TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              }, 
              child: Text(
                _isExpanded ? '閉じる' : '開く'
              ),
            )
          ],
        );
      } else {
        return Text(
          widget.data,
          style: textStyle,
          maxLines: widget.maxLines,
        );
      }
    });
  }
}