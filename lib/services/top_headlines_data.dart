import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:haber/models/response_model.dart';
import 'package:http/http.dart' as http;

class HeadlineClass {
  List<ResponseModel> headlines = [];

  Future<void> getHeadlines() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=6&apiKey=${dotenv.env['API_KEY']}";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            element["author"] != null) {
          ResponseModel responseModel = ResponseModel.fromJson(element);
          headlines.add(responseModel);
        }
      });
    }
  }
}
