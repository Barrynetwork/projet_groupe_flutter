class Program {
  final String id;
  final String title;
  final String channel;
  final String category;
  final String startTime; // "21:25"
  final String endTime; // "22:10"
  final String thumbnail;

  Program({
    required this.id,
    required this.title,
    required this.channel,
    required this.category,
    required this.startTime,
    required this.endTime,
    required this.thumbnail,
  });

  factory Program.fromJson(Map<String, dynamic> j) => Program(
    id: j['id'],
    title: j['title'],
    channel: j['channel'],
    category: j['category'],
    startTime: j['startTime'],
    endTime: j['endTime'],
    thumbnail: j['thumbnail'] ?? '',
  );
}