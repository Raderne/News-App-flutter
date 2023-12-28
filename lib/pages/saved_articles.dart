import 'package:flutter/material.dart';
import 'package:haber/services/cloud/cloud_article.dart';
import 'package:haber/services/cloud/firebase_cloud_storage.dart';
import 'package:haber/views/saved_news_tile.dart';
import 'package:haber/widgets/floating_appbar.dart';

class SavedArticlesPage extends StatefulWidget {
  const SavedArticlesPage({super.key});

  @override
  State<SavedArticlesPage> createState() => _SavedArticlesPageState();
}

class _SavedArticlesPageState extends State<SavedArticlesPage> {
  late final FirebaseCloudStorage _articlesService;

  @override
  void initState() {
    _articlesService = FirebaseCloudStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Kayıtlı Haberler',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Nunito-Black",
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: _articlesService.getArticles(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                final articles = snapshot.data as Iterable<CloudArticle>;

                if (articles.isEmpty) {
                  return const Center(
                    child: Text('Hiç kayıtlı haber yok'),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 30,
                  ),
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles.elementAt(index);
                    return SavedNewsTile(
                      title: article.title,
                      author: article.author,
                      description: article.description,
                      url: article.url,
                      image: article.urlToImage,
                      content: article.content,
                      onDelete: () async {
                        await _articlesService.deleteArticle(article.title);
                        setState(() {});
                      },
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('Hiç kayıtlı haber yok'),
                );
              }
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: const FloatingBottomAppBar(
        isHome: false,
        isBookmark: true,
        isProfilePage: false,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
