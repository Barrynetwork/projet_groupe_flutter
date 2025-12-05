import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/video_provider.dart';

class ReplayListScreen extends StatefulWidget {
  const ReplayListScreen({super.key});

  @override
  State<ReplayListScreen> createState() => _ReplayListScreenState();
}

class _ReplayListScreenState extends State<ReplayListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<VideoProvider>().load());
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<VideoProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Replays disponibles')),
      body: vm.loading
          ? const Center(child: CircularProgressIndicator())
          : vm.error != null
          ? Center(child: Text(vm.error!))
          : ListView.builder(
              itemCount: vm.videos.length,
              itemBuilder: (context, index) {
                final video = vm.videos[index];
                return ListTile(
                  leading: video.thumbnail.isNotEmpty
                      ? Image.network(
                          video.thumbnail,
                          width: 80,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.play_circle_fill),
                        )
                      : const Icon(Icons.play_circle_fill),
                  title: Text(video.title),
                  subtitle: Text(video.platform),
                  trailing: const Icon(Icons.play_arrow),
                  onTap: () => context.go('/video/${video.id}'),
                );
              },
            ),
    );
  }
}
