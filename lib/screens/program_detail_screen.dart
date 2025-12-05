import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/program_provider.dart';
import '../models/program.dart';

class ProgramDetailScreen extends StatelessWidget {
  final String id;
  const ProgramDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final program = context.watch<ProgramProvider>().programs.firstWhere(
      (p) => p.id == id,
      orElse: () => Program(
        id: 'error',
        title: 'Programme introuvable',
        channel: '',
        category: '',
        startTime: '',
        endTime: '',
        thumbnail: '',
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(program.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (program.thumbnail.isNotEmpty)
              Image.network(
                program.thumbnail,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.tv),
              ),
            const SizedBox(height: 16),
            Text(
              '${program.channel} • ${program.category}',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              'Horaire : ${program.startTime} - ${program.endTime}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
