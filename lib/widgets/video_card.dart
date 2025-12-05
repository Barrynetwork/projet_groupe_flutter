import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/video.dart';

class VideoCard extends StatelessWidget {
  final Video v;
  const VideoCard({super.key, required this.v});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: v.thumbnail.isNotEmpty
            ? Image.network(v.thumbnail, width: 56, fit: BoxFit.cover)
            : const Icon(Icons.play_circle_fill),
        title: Text(v.title),
        subtitle: Text('Plateforme: ${v.platform}'),
        onTap: () => context.go('/video/${v.id}'),
      ),
    );
  }
}
