import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/news.dart';

class NewsCard extends StatelessWidget {
  final News n;
  const NewsCard({super.key, required this.n});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: n.imageUrl.isNotEmpty
            ? Image.network(n.imageUrl, width: 56, fit: BoxFit.cover)
            : const Icon(Icons.article),
        title: Text(n.title),
        subtitle: Text(n.category),
        onTap: () => context.go('/news/${n.id}'),
      ),
    );
  }
}
