import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/program.dart';

class ProgramCard extends StatelessWidget {
  final Program p;
  const ProgramCard({super.key, required this.p});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: p.thumbnail.isNotEmpty
            ? Image.network(p.thumbnail, width: 56, fit: BoxFit.cover)
            : const Icon(Icons.tv),
        title: Text(p.title),
        subtitle: Text(
          '${p.channel} • ${p.category}\n${p.startTime} - ${p.endTime}',
        ),
        onTap: () => context.go('/program/${p.id}'),
      ),
    );
  }
}
