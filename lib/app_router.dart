import 'package:go_router/go_router.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/program_list_screen.dart';
import 'screens/news_list_screen.dart';
import 'screens/replay_list_screen.dart';
import 'screens/program_detail_screen.dart';
import 'screens/news_detail_screen.dart';
import 'screens/video_detail_screen.dart';
import 'screens/radio_list_screen.dart';
import 'screens/radio_detail_screen.dart'; 

GoRouter buildRouter() {
  return GoRouter(
    routes: [
      
      GoRoute(path: '/', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),

   
      GoRoute(path: '/programs', builder: (_, __) => const ProgramListScreen()),
      GoRoute(
        path: '/program/:id',
        builder: (_, state) =>
            ProgramDetailScreen(id: state.pathParameters['id']!),
      ),

      
      GoRoute(path: '/news', builder: (_, __) => const NewsListScreen()),
      GoRoute(
        path: '/news/:id',
        builder: (_, state) =>
            NewsDetailScreen(id: state.pathParameters['id']!),
      ),

      
      GoRoute(path: '/replay', builder: (_, __) => const ReplayListScreen()),

      
      GoRoute(path: '/radios', builder: (_, __) => const RadioListScreen()),
      GoRoute(
        path: '/radio/:id',
        builder: (_, state) =>
            RadioDetailScreen(id: state.pathParameters['id']!),
      ),

      
      GoRoute(
        path: '/video/:id',
        builder: (_, state) =>
            VideoDetailScreen(id: state.pathParameters['id']!),
      ),
    ],
  );
}
