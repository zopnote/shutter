class ArticleContent {
  final String title;
  final String author;
  final String description;
  final String contentText;

  ArticleContent({
    required this.title,
    required this.author,
    required this.description,
    required this.contentText,
  });

  String getAuthor() {
    return author;
  }

  String getTitle() {
    return title;
  }

  String getDescription() {
    return description;
  }

  String getContentText() {
    return contentText;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'contentText': contentText,
    };
  }
}
