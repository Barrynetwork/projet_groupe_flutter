import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_rts/models/radio.dart';
import '../models/program.dart';
import '../models/news.dart';
import '../models/video.dart';
import 'repository.dart';

class LocalRepository implements Repository {
  @override
  @override
  Future<List<RadioStation>> fetchRadios() async {
    final s = await rootBundle.loadString('assets/mock/radios.json');
    final data = jsonDecode(s) as List;
    return data.map((e) => RadioStation.fromJson(e)).toList();
  }

  Future<List<Program>> fetchPrograms() async {
    final s = await rootBundle.loadString('assets/mock/programs.json');
    final data = jsonDecode(s) as List;
    return data.map((e) => Program.fromJson(e)).toList();
    // Vous pouvez filtrer par chaîne si besoin
  }

  @override
  Future<List<News>> fetchNews() async {
    final s = await rootBundle.loadString('assets/mock/news.json');
    final data = jsonDecode(s) as List;
    return data.map((e) => News.fromJson(e)).toList();
  }

  @override
  Future<List<Video>> fetchVideos() async {
    final s = await rootBundle.loadString('assets/mock/videos.json');
    final data = jsonDecode(s) as List;
    return data.map((e) => Video.fromJson(e)).toList();
  }
}
