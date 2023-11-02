import 'dart:convert';

import 'package:haber/models/response_model.dart';
import 'package:http/http.dart' as http;

class BottomNewsData {
  List<ResponseModel> bottomNews = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&pageSize=15&apiKey=278f45056a454eb7977466845b59c31c";
    
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            element["author"] != null) {
          ResponseModel responseModel = ResponseModel.fromJson(element);
          bottomNews.add(responseModel);
        }
      });
    }
  }
}
