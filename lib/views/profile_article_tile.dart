import 'dart:io';

import 'package:flutter/material.dart';
import 'package:haber/pages/article_details.dart';
import 'package:haber/pages/edit_article_page.dart';

typedef OnDelete = void Function();

class ArticleCard extends StatelessWidget {
  final String? id;
  final String? author;
  final String? title;
  final String? description;
  final String? content;
  final String? url;
  final String? image;
  final String? category;
  final int? index;

  final OnDelete onDelete;

  const ArticleCard({
    super.key,
    this.author,
    this.title,
    this.description,
    this.content,
    this.url,
    this.image,
    this.category,
    this.index,
    this.id,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetails(
              title: title!,
              author: author!,
              image:
                  "https://images.unsplash.com/photo-1603346133929-24265debae88?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              content: content!,
              description: description!,
              url: url!,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: FileImage(File(image!)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Text(
                    (index! + 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Nunito-Black',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Nunito-Black',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          author!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Nunito-Regular',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditArticlePage(
                            id: id!,
                            title: title!,
                            description: description!,
                            content: content!,
                            url: url!,
                            image: image!,
                            category: category!,
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      color: Colors.green[200],
                      size: 50,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      onDelete();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Makale Silindi.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "Nunito-Regular",
                            ),
                          ),
                          margin: EdgeInsets.all(20),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: Colors.red[200],
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
