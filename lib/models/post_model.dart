class Post {
  final int nomor;
  final String nama;
  final String nama_latin;
  final int jumlah_ayat;
  final String tempat_turun;
  final String arti;
  final List<Ayat>? ayat;

  Post({
    required this.nomor,
    required this.nama,
    required this.nama_latin,
    required this.jumlah_ayat,
    required this.tempat_turun,
    required this.arti,
    this.ayat,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    var ayatList = json['ayat'] as List?;
    List<Ayat>? ayat = ayatList?.map((i) => Ayat.fromJson(i)).toList();

    return Post(
      nomor: json['nomor'],
      nama: json['nama'],
      nama_latin: json['nama_latin'],
      jumlah_ayat: json['jumlah_ayat'],
      tempat_turun: json['tempat_turun'],
      arti: json['arti'],
      ayat: ayat,
    );
  }
}

class Ayat {
  final int nomor;
  final String ar;
  final String tr;
  final String idn;

  Ayat({
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.idn,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      nomor: json['nomor'],
      ar: json['ar'],
      tr: json['tr'],
      idn: json['idn'],
    );
  }
}
