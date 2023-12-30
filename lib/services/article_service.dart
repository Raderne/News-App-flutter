import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:haber/models/user_model.dart';
import 'package:http/io_client.dart';
import 'package:haber/models/article_model.dart';

class MyClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(httpClient);
    try {
      return await ioClient.send(request);
    } finally {
      ioClient.close();
    }
  }
}

class ArticleService {
  String? _token;

  ArticleService(String token) {
    _token = token;
  }

  String baseUrl = 'https://192.168.1.102:5000/api/articles';
  List<ArticleModel> articles = [];
  http.Client client = MyClient();

  Future<List<ArticleModel>> getArticles() async {
    final response = await client.get(
      Uri.parse('$baseUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      articles =
          body.map((dynamic item) => ArticleModel.fromJson(item)).toList();
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }

  Future<ArticleModel> createArticle(
    String title,
    String description,
    String content,
    String url,
    String category,
  ) async {
    final response = await client.post(
      Uri.parse('$baseUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $_token',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'description': description,
        'content': content,
        'url': url,
        'img': '',
        'category': category,
      }),
    );

    if (response.statusCode == 201) {
      return ArticleModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create article');
    }
  }

  Future<ArticleModel> updateArticle(
    String id,
    String title,
    String description,
    String content,
    String url,
    String category,
  ) async {
    final response = await client.patch(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $_token',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'description': description,
        'content': content,
        'url': url,
        'img': '',
        'category': category,
      }),
    );

    if (response.statusCode == 200) {
      return ArticleModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update article');
    }
  }

  Future<void> deleteArticle(String id) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete article');
    }
  }
}
