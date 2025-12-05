import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:provider/provider.dart';
import '../providers/radio_provider.dart';

class RadioDetailScreen extends StatefulWidget {
  final String id;
  const RadioDetailScreen({super.key, required this.id});

  @override
  State<RadioDetailScreen> createState() => _RadioDetailScreenState();
}

class _RadioDetailScreenState extends State<RadioDetailScreen> {
  late AudioPlayer _player;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initAudio();
  }

  Future<void> _initAudio() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());

    final radio = context.read<RadioProvider>().radios.firstWhere(
      (r) => r.id == widget.id,
    );
    try {
      await _player.setUrl(radio.streamUrl);
    } catch (e) {
      debugPrint('Erreur chargement flux audio: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final radio = context.watch<RadioProvider>().radios.firstWhere(
      (r) => r.id == widget.id,
    );

    return Scaffold(
      appBar: AppBar(title: Text(radio.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${radio.frequency} — ${radio.description}'),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () async {
              if (_isPlaying) {
                await _player.pause();
              } else {
                await _player.play();
              }
              setState(() => _isPlaying = !_isPlaying);
            },
            child: Text(_isPlaying ? 'Pause' : 'Écouter en direct'),
          ),
        ],
      ),
    );
  }
}
