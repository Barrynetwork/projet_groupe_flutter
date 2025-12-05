class RadioStation {
  final String id;
  final String name;
  final String frequency;
  final String description;
  final String streamUrl;
  final String logoUrl;

  RadioStation({
    required this.id,
    required this.name,
    required this.frequency,
    required this.description,
    required this.streamUrl,
    required this.logoUrl,
  });

  factory RadioStation.fromJson(Map<String, dynamic> j) => RadioStation(
    id: j['id'],
    name: j['name'],
    frequency: j['frequency'],
    description: j['description'],
    streamUrl: j['streamUrl'],
    logoUrl: j['logoUrl'] ?? '',
  );
}
