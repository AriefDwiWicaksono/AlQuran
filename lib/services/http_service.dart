import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class HttpService {
  final String baseUrl = "https://quran-api.santrikoding.com/api/surah";

  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((item) => Post.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load posts");
    }
  }

  Future<Post> getDetail(int nomor) async {
    final response = await http.get(Uri.parse("$baseUrl/$nomor"));
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load detail");
    }
  }
}
