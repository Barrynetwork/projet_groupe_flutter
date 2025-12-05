class Video {
  final String id;
  final String title;
  final String platform;
  final String url; 
  final String thumbnail;

  Video({
    required this.id,
    required this.title,
    required this.platform,
    required this.url,
    required this.thumbnail,
  });

  factory Video.fromJson(Map<String, dynamic> j) => Video(
    id: j['id'],
    title: j['title'],
    platform: j['platform'],
    url: j['url'],
    thumbnail: j['thumbnail'] ?? '',
  );
}

