import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class HttpService {
  final String postsURL = "https://quran-api.santrikoding.com/api/surah";

  Future<List<Post>> getPosts({int? nomor}) async {
    Uri uri;
    if (nomor != null) {
      uri = Uri.parse("$postsURL/$nomor");
    } else {
      uri = Uri.parse(postsURL);
    }

    http.Response res = await http.get(uri);

    if (res.statusCode == 200) {
      if (nomor != null) {
        Map<String, dynamic> body = jsonDecode(res.body);
        return [Post.fromJson(body)];
      } else {
        List<dynamic> body = jsonDecode(res.body);
        return body.map((dynamic item) => Post.fromJson(item)).toList();
      }
    } else {
      throw "Unable to retrieve data.";
    }
  }
}
