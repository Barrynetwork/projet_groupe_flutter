class News {
  final String id;
  final String title;
  final String category;
  final String summary;
  final String content; 
  final String imageUrl;

  News({
    required this.id,
    required this.title,
    required this.category,
    required this.summary,
    required this.content,
    required this.imageUrl,
  });

  factory News.fromJson(Map<String, dynamic> j) => News(
    id: j['id'],
    title: j['title'],
    category: j['category'],
    summary: j['summary'],
    content: j['content'] ?? '',
    imageUrl: j['imageUrl'] ?? '',
  );
}

