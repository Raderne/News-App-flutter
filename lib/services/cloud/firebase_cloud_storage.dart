import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haber/services/cloud/cloud_article.dart';

class FirebaseCloudStorage {
  final articles = FirebaseFirestore.instance.collection('articles');

  Future<void> saveArticle({
    required String author,
    required String title,
    required String description,
    required String image,
    required String url,
    required String content,
  }) async {
    try {
      await articles.doc(title).set({
        'author': author,
        'title': title,
        'description': description,
        'image': image,
        'url': url,
        'content': content,
      });
    } catch (e) {
      // TODO: Handle error
      // throw CloudArticleException(
      //   message: 'Failed to save article',
      //   error: e.toString(),
      // );
      throw e;
    }
  }

  Future<void> deleteArticle(String id) async {
    await articles.doc(id).delete();
  }

  Future<Iterable<CloudArticle>> getArticles() async {
    try {
      return articles.get().then(
            (value) => value.docs.map(
              (doc) => CloudArticle(
                  author: doc['author'],
                  title: doc['title'],
                  description: doc['description'],
                  url: doc['url'],
                  urlToImage: doc['image'],
                  content: doc['content']),
            ),
          );
    } catch (e) {
      throw e;
    }
  }
}
