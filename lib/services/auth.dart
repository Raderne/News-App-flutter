import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:haber/models/user_model.dart';
import 'package:http/io_client.dart';

class MyClient extends http.BaseClient {

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

class AuthService {
  String URL = 'https://192.168.1.102:5000/api/auth';
  http.Client client = MyClient();

  Future<UserModel> login(String email, String password) async {
    final response = await client.post(
      Uri.parse('$URL/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{'email': email, 'password': password},
      ),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<UserModel> register(
    String name,
    String lastName,
    String email,
    String password,
  ) async {
    final response = await client.post(
      Uri.parse('$URL/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'lastName': lastName,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register');
    }
  }
}
