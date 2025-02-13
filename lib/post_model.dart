class Post {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String deskripsi;
  final String tempatTurun;
  final String arti;
  final List<Ayat>? ayat;

  Post({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.deskripsi,
    required this.tempatTurun,
    required this.arti,
    this.ayat,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      nomor: json['nomor'] as int,
      nama: json['nama'] as String,
      namaLatin: json['nama_latin'] as String,
      jumlahAyat: json['jumlah_ayat'] as int,
      tempatTurun: json['tempat_turun'] as String,
      arti: json['arti'] as String,
      deskripsi: json['deskripsi'] as String,
      ayat: (json['ayat'] as List?)?.map((i) => Ayat.fromJson(i)).toList(),
    );
  }
}

class Ayat {
  final int nomor;
  final String ar;
  final String idn;

  Ayat({
    required this.nomor,
    required this.ar,
    required this.idn,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      nomor: json['nomor'] as int,
      ar: json['ar'] as String,
      idn: json['idn'] as String,
    );
  }
}