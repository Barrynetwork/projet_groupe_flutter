import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../providers/video_provider.dart';
import '../models/video.dart';

class VideoDetailScreen extends StatefulWidget {
  final String id;
  const VideoDetailScreen({super.key, required this.id});

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  VideoPlayerController? _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    final video = context.read<VideoProvider>().videos.firstWhere(
      (v) => v.id == widget.id,
      orElse: () => Video(
        id: 'error',
        title: 'Vidéo introuvable',
        platform: '',
        url: '',
        thumbnail: '',
      ),
    );

    if (video.url.isNotEmpty) {
      _controller = VideoPlayerController.network(video.url)
        ..initialize().then((_) {
          setState(() => _initialized = true);
          _controller?.play();
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final video = context.watch<VideoProvider>().videos.firstWhere(
      (v) => v.id == widget.id,
      orElse: () => Video(
        id: 'error',
        title: 'Vidéo introuvable',
        platform: '',
        url: '',
        thumbnail: '',
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(video.title)),
      body: Center(
        child: _initialized && _controller != null
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: _initialized && _controller != null
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller!.value.isPlaying
                      ? _controller!.pause()
                      : _controller!.play();
                });
              },
              child: Icon(
                _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            )
          : null,
    );
  }
}
