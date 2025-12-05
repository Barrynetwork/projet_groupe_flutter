import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repositories/local_repository.dart';
import 'providers/auth_provider.dart';
import 'providers/program_provider.dart';
import 'providers/news_provider.dart';
import 'providers/video_provider.dart';
import 'providers/radio_provider.dart';
import 'theme.dart';
import 'app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final repo = LocalRepository();
  runApp(App(repo: repo));
}

class App extends StatelessWidget {
  final LocalRepository repo;
  const App({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    final router = buildRouter();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProgramProvider(repo)),
        ChangeNotifierProvider(create: (_) => NewsProvider(repo)),
        ChangeNotifierProvider(create: (_) => VideoProvider(repo)),
        ChangeNotifierProvider(create: (_) => RadioProvider(repo)),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: buildTheme(),
      ),
    );
  }
}
