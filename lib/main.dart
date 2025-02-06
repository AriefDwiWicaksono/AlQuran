import 'package:flutter/material.dart';
import 'pages/posts_page.dart';

void main() {
  runApp(QuranApp());
}

class QuranApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al-Quran App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PostsPage(),
    );
  }
}