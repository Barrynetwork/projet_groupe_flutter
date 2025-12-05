import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../models/news.dart';

class NewsDetailScreen extends StatelessWidget {
  final String id;
  const NewsDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final news = context.watch<NewsProvider>().items.firstWhere(
      (n) => n.id == id,
      orElse: () => News(
        id: 'error',
        title: 'Article introuvable',
        category: '',
        summary: '',
        content: '',
        imageUrl: '',
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(news.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.imageUrl.isNotEmpty)
              Image.network(
                news.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.article),
              ),
            const SizedBox(height: 16),
            Text(news.category, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Text(news.summary, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(news.content, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
