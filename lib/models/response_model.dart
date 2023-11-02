class ResponseModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;

  ResponseModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> jsonElement) {
    return ResponseModel(
      author: jsonElement["author"] ?? "Anonymous",
      title: jsonElement["title"] ?? "No Title",
      description: jsonElement["description"] ?? "No Description",
      url: jsonElement["url"] ?? "No URL",
      urlToImage: jsonElement["urlToImage"] ?? "assets/images/no_image.png",
      content: jsonElement["content"] ?? "No Content",
    );
  }
}
