class ArticleModel {
  String? id;
  String? author;
  String? title;
  String? description;
  String? url;
  String? img;
  String? content;
  String? category;

  ArticleModel({
    this.id,
    this.author,
    this.title,
    this.description,
    this.content,
    this.url,
    this.img,
    this.category,
  });

  // factory method
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['_id'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      content: json['content'],
      url: json['url'],
      img: json['img'],
      category: json['category'],
    );
  }
}
