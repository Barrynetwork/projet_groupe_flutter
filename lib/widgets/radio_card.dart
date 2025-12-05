import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/radio.dart';

class RadioCard extends StatelessWidget {
  final RadioStation r;
  const RadioCard({super.key, required this.r});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: r.logoUrl.isNotEmpty
            ? Image.network(r.logoUrl, width: 56, fit: BoxFit.cover)
            : const Icon(Icons.radio),

        title: Text(
          r.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${r.frequency}\n${r.description}'),
        onTap: () => context.go('/radio/${r.id}'),
      ),
    );
  }
}
