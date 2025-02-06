import 'package:flutter/material.dart';
import '../models/post_model.dart';

class AyatTile extends StatelessWidget {
  final Ayat ayat;

  AyatTile({required this.ayat});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(ayat.ar, textAlign: TextAlign.right, style: TextStyle(fontSize: 20)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ayat.tr, style: TextStyle(fontStyle: FontStyle.italic)),
            Text(ayat.idn),
          ],
        ),
      ),
    );
  }
}
