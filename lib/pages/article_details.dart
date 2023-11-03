import 'package:flutter/material.dart';
import 'package:haber/constants/colors.dart';
import 'package:haber/services/cloud/firebase_cloud_storage.dart';

class ArticleDetails extends StatefulWidget {
  final String author;
  final String title;
  final String description;
  final String image;
  final String url;
  final String content;

  const ArticleDetails({
    super.key,
    required this.author,
    required this.title,
    required this.description,
    required this.image,
    required this.url,
    required this.content,
  });

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  late final FirebaseCloudStorage _articlesService;
  bool? _isSaved;

  @override
  void initState() {
    _articlesService = FirebaseCloudStorage();
    _isSaved = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [
              Hero(
                tag: widget.image,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.55,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.description,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.content,
                      style: const TextStyle(height: 1.5),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "For more info visit:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.url,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4 - 10,
                  ),
                  height: 190,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey,
                        Colors.white54,
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: "Nunito-Bold",
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                        Text(
                          widget.author,
                          softWrap: true,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 10,
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: primaryClr,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryClr,
          onPressed: () async {
            if (_isSaved!) {
              await _articlesService.deleteArticle(widget.title);
              setState(() {
                _isSaved = false;
              });
              return;
            } else {
              await _articlesService.saveArticle(
                author: widget.author,
                title: widget.title,
                description: widget.description,
                image: widget.image,
                url: widget.url,
                content: widget.content,
              );
              setState(() {
                _isSaved = true;
              });
            }
          },
          child: Icon(
            _isSaved! ? Icons.bookmark : Icons.bookmark_outline,
            color: Colors.white,
          ),
        ));
  }
}
