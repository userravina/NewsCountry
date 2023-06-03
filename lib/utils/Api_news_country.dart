import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newscountry/news_country/modal/news_modal.dart';
class Api_News
{
  Future<NewsModal> getnewsdata({required String country})
  async {
    String like="https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=d3e15d825d5b42538b4f57de7a6deb33";
    var responce = await http.get(Uri.parse(like));

    var json = jsonDecode(responce.body);

    NewsModal data = NewsModal.fromjson(json);

    return data;
  }
}