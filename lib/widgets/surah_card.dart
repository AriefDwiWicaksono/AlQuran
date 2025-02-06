import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../pages/detail_page.dart';

class SurahCard extends StatelessWidget {
  final Post post;

  SurahCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("${post.nomor}. ${post.nama_latin}",
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(post.arti),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(nomor: post.nomor),
            ),
          );
        },
      ),
    );
  }
}