import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'post_model.dart';
import 'http_service.dart';

class DetailPage extends StatelessWidget {
  final HttpService httpService = HttpService();
  final int nomor;

  DetailPage({required this.nomor});

  // Fungsi untuk menghilangkan tag HTML dari teks
  String removeHtmlTags(String htmlText) {
    return parse(htmlText).body?.text ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Surah"),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: FutureBuilder<Post>(
        future: httpService.getPosts(nomor: nomor).then((listPost) => listPost.first),
        builder: (BuildContext context, AsyncSnapshot<Post> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return Center(child: Text("Data tidak ditemukan"));
          } else {
            Post detail = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "QS ${detail.namaLatin} (${detail.nama})",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Arti : ${detail.arti}", style: TextStyle(fontSize: 16, color: Colors.black)),
                        Text("Tempat turun : ${detail.tempatTurun}", style: TextStyle(fontSize: 16, color: Colors.black)),
                        Text("Jumlah ayat : ${detail.jumlahAyat}", style: TextStyle(fontSize: 16, color: Colors.black)),
                        Text("Deskripsi : ${removeHtmlTags(detail.deskripsi)}", style: TextStyle(fontSize: 16, color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  if (detail.ayat != null && detail.ayat!.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: detail.ayat!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Ayat ayat = detail.ayat![index];
                        return Card(
                          margin: EdgeInsets.only(bottom: 10),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.lightBlueAccent,
                                      child: Text(
                                        "${ayat.nomor}",
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        ayat.ar,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  ayat.idn,
                                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  if (detail.ayat == null || detail.ayat!.isEmpty)
                    Center(
                      child: Text(
                        "Tidak ada ayat yang tersedia",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
