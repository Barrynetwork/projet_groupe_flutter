import 'package:flutter_rts/models/radio.dart';

import '../models/program.dart';
import '../models/news.dart';
import '../models/video.dart';

abstract class Repository {
  Future<List<Program>> fetchPrograms();
  Future<List<News>> fetchNews();
  Future<List<Video>> fetchVideos();
  Future<List<RadioStation>> fetchRadios();
}
