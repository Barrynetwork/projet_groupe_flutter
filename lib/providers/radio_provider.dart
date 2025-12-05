import 'package:flutter/foundation.dart';
import '../repositories/local_repository.dart';
import '../models/radio.dart';

class RadioProvider with ChangeNotifier {
  final LocalRepository repo;
  RadioProvider(this.repo);

  List<RadioStation> radios = [];
  bool loading = false;
  String? error;

  Future<void> load() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      radios = await repo.fetchRadios();
    } catch (e) {
      error = 'Erreur chargement radios';
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
