import 'package:flutter/material.dart';
import 'package:haber/constants/colors.dart';
import 'package:haber/models/response_model.dart';
import 'package:haber/services/search_article_data.dart';
import 'package:haber/views/bottom_news_tile.dart';

class SearchPage extends StatefulWidget {
  final String? searchInput;
  const SearchPage({super.key, required this.searchInput});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;
  bool _loading = true;
  String query = "";

  List<ResponseModel> searchResults = [];

  @override
  void initState() {
    query = widget.searchInput!;
    _searchController = TextEditingController(text: query);
    getSearchedResults(query);
    super.initState();
  }

  getSearchedResults(String search) async {
    SearchArticleData searchArticleData = SearchArticleData();
    await searchArticleData.searchArticle(search);
    searchResults = searchArticleData.searchNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryClr),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Haber",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Nunito-Bold",
                fontSize: 30,
              ),
            ),
            Text(
              "Toplayıcı",
              style: TextStyle(
                color: primaryClr,
                fontFamily: "Nunito-Bold",
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              TextField(
                onSubmitted: (value) {
                  setState(() {
                    query = value;
                    _loading = true;
                  });
                  if (query.length > 0) {
                    getSearchedResults(query);
                  }
                },
                maxLines: 1,
                controller: _searchController,
                decoration: InputDecoration(
                    hintText: "Makale Ara",
                    hintStyle: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                    ),
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: primaryClr,
                      ),
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                _searchController.clear();
                                query = "";
                              });
                            },
                            icon: const Icon(Icons.clear))
                        : const Icon(Icons.search)),
              ),
              const SizedBox(height: 26),
              _loading
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        String title = searchResults[index].title!;
                        String author = searchResults[index].author!;
                        String image = searchResults[index].urlToImage!;
                        String content = searchResults[index].content!;
                        String description = searchResults[index].description!;
                        String url = searchResults[index].url!;

                        return BottomNewsTile(
                          title: title,
                          author: author,
                          image: image,
                          content: content,
                          description: description,
                          url: url,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
