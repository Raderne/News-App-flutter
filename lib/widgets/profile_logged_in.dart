import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:haber/constants/colors.dart';
import 'package:haber/constants/routes.dart';
import 'package:haber/models/article_model.dart';
import 'package:haber/services/article_service.dart';
import 'package:haber/views/profile_article_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileLoggedInPage extends StatefulWidget {
  const ProfileLoggedInPage({super.key});

  @override
  State<ProfileLoggedInPage> createState() => _ProfileLoggedInPageState();
}

class _ProfileLoggedInPageState extends State<ProfileLoggedInPage> {
  List<ArticleModel> articles = [];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late String _name;
  late String _lastName;
  late String _email;

  bool _isArticleLoading = true;

  Future<void> getPrefsData() async {
    final SharedPreferences prefs = await _prefs;
    final String name = prefs.getString('name') ?? '';
    final String lastName = prefs.getString('lastName') ?? '';
    final String email = prefs.getString('email') ?? '';

    setState(() {
      _name = name;
      _lastName = lastName;
      _email = email;
    });
  }

  @override
  void initState() {
    super.initState();
    _name = '';
    _lastName = '';
    _email = '';

    getPrefsData();
    getArticles();
  }

  logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('token');
    prefs.remove('name');
    prefs.remove('lastName');
    prefs.remove('email');
  }

  getArticles() async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString('token') ?? '';
    ArticleService articleService = ArticleService(token);
    articles = await articleService.getArticles();

    setState(() {
      _isArticleLoading = false;
    });
  }

  Future<void> deleteArticle(String id) async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString('token') ?? '';

    await ArticleService(token).deleteArticle(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Profilim',
                  style: TextStyle(
                    color: secondaryDarkBlueClr,
                    fontSize: 25,
                    fontFamily: 'Nunito-Black',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await logout();
                    Navigator.popAndPushNamed(context, profileRoute);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(secondaryDarkBlueClr),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                    ),
                  ),
                  child: const Text(
                    'ÇIKIŞ YAP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Nunito-Black',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Kişisel Bilgileriniz',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Nunito-Black',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.black87,
                  size: 35,
                ),
                const SizedBox(width: 20),
                Text(
                  _name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Nunito-Regular',
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
            Row(
              children: [
                const Icon(
                  Icons.person_2,
                  color: Colors.black87,
                  size: 35,
                ),
                const SizedBox(width: 20),
                Text(
                  _lastName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Nunito-Regular',
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
            Row(
              children: [
                const Icon(
                  Icons.email,
                  color: Colors.black87,
                  size: 35,
                ),
                const SizedBox(width: 20),
                Text(
                  _email,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Nunito-Regular',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Benim Makalelerim',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'Nunito-Black',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, addArticleRoute);
                  },
                  child: const Text(
                    'EKLE >',
                    style: TextStyle(
                      color: secondaryDarkBlueClr,
                      fontSize: 20,
                      fontFamily: 'Nunito-Regular',
                    ),
                  ),
                ),
              ],
            ),
            _isArticleLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 70),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        String? id = articles[index].id;
                        String? author = articles[index].author;
                        String? title = articles[index].title;
                        String? description = articles[index].description;
                        String? content = articles[index].content;
                        String? url = articles[index].url;
                        String? category = articles[index].category;

                        return ArticleCard(
                          id: id,
                          author: author,
                          title: title,
                          description: description,
                          content: content,
                          url: url,
                          category: category,
                          index: index,
                          onDelete: () async {
                            await deleteArticle(id!);
                            setState(() {
                              articles.removeAt(index);
                            });
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
