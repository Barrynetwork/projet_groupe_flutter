import 'package:flutter/foundation.dart';
import 'package:flutter_rts/repositories/local_repository.dart';
import '../models/program.dart';

class ProgramProvider extends ChangeNotifier {
  final LocalRepository repo;
  ProgramProvider(this.repo);

  List<Program> programs = [];
  bool loading = false;
  String? error;

  Future<void> load() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      programs = await repo.fetchPrograms();
    } catch (e) {
      error = 'Erreur chargement programmes';
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
