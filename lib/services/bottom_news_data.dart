import 'dart:convert';

import 'package:haber/models/response_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BottomNewsData {
  List<ResponseModel> bottomNews = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&pageSize=15&apiKey=${dotenv.env['API_KEY']}";

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
