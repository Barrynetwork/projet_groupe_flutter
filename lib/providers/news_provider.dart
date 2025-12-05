import 'package:flutter/foundation.dart';
import 'package:flutter_rts/repositories/local_repository.dart';
import '../models/news.dart';

class NewsProvider extends ChangeNotifier {
  final LocalRepository repo;
  NewsProvider(this.repo);

  List<News> items = [];
  bool loading = false;
  String? error;

  Future<void> load() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      items = await repo.fetchNews();
    } catch (e) {
      error = 'Erreur chargement actualités';
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
