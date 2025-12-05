import 'package:flutter/foundation.dart';
import '../repositories/local_repository.dart';
import '../models/video.dart';

class VideoProvider with ChangeNotifier {
  final LocalRepository repo;
  VideoProvider(this.repo);

  List<Video> videos = [];
  bool loading = false;
  String? error;

  Future<void> load() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      videos = await repo.fetchVideos();
    } catch (e) {
      error = 'Erreur chargement vidéos';
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
