import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../services/http_service.dart';
import '../widgets/ayat_tile.dart';

class DetailPage extends StatelessWidget {
  final int nomor;
  final HttpService httpService = HttpService();

  DetailPage({required this.nomor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Surah $nomor'),
      ),
      body: FutureBuilder<Post>(
        future: httpService.getDetail(nomor),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.ayat!
                  .map((ayat) => AyatTile(ayat: ayat))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}