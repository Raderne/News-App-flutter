import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:haber/constants/colors.dart';
import 'package:haber/models/category_model.dart';
import 'package:haber/models/response_model.dart';
import 'package:haber/pages/search_articles.dart';
import 'package:haber/services/bottom_news_data.dart';
import 'package:haber/services/category_data.dart';
import 'package:haber/services/top_headlines_data.dart';
import 'package:haber/views/bottom_news_tile.dart';
import 'package:haber/views/category_tile.dart';
import 'package:haber/widgets/floating_appbar.dart';
import 'package:haber/widgets/indicator.dart';
import 'package:haber/widgets/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;
  bool _loading = true;
  int _currentIndex = 0;

  List<ResponseModel> topHeadlines = [];
  List<ResponseModel> allNews = [];
  List<CategoryModel> categories = [];

  @override
  void initState() {
    _searchController = TextEditingController();
    categories = getCategories();
    getHeadlines();
    getBottomNews("general");
    super.initState();
  }

  getHeadlines() async {
    HeadlineClass headlineClass = HeadlineClass();
    await headlineClass.getHeadlines();
    topHeadlines = headlineClass.headlines;
  }

  getBottomNews(String category) async {
    BottomNewsData bottomNewsData = BottomNewsData();
    await bottomNewsData.getNews(category);
    allNews = bottomNewsData.bottomNews;
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
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
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
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: primaryClr,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            onPressed: () {
                              if (_searchController.text.isEmpty) return;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchPage(
                                    searchInput: _searchController.text,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    const Text(
                      "Son Haberler",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Nunito-Black",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CarouselSlider.builder(
                      itemCount: topHeadlines.length,
                      itemBuilder: (context, index, realIndex) {
                        String title = topHeadlines[index].title!;
                        String author = topHeadlines[index].author!;
                        String image = topHeadlines[index].urlToImage!;
                        String content = topHeadlines[index].content!;
                        String description = topHeadlines[index].description!;
                        String url = topHeadlines[index].url!;

                        return sliderWidget(title, author, index, image,
                            content, description, url, context);
                      },
                      options: CarouselOptions(
                        height: 250,
                        autoPlay: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.easeInOut,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(child: indicatorWidget(_currentIndex)),
                    const SizedBox(height: 26),
                    const Text(
                      "Tüm Haberler",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Nunito-Black",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            category: categories[index].categoryName!,
                            isSelected: categories[index].isSelected,
                            onSelected: (category) {
                              setState(() {
                                for (int i = 0; i < categories.length; i++) {
                                  categories[i].isSelected = false;
                                }
                                categories[index].isSelected = true;
                              });
                              getBottomNews(categories[index].categoryName!);
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: allNews.length,
                      itemBuilder: (context, index) {
                        String title = allNews[index].title!;
                        String author = allNews[index].author!;
                        String image = allNews[index].urlToImage!;
                        String content = allNews[index].content!;
                        String description = allNews[index].description!;
                        String url = allNews[index].url!;

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
      floatingActionButton: const FloatingBottomAppBar(
        isBookmark: false,
        isHome: true,
        isProfilePage: false,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
