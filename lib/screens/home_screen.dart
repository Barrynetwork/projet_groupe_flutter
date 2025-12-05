import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil RTS')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Menu')),
            ListTile(
              leading: const Icon(Icons.tv),
              title: const Text('Programmes'),
              onTap: () => context.go('/programs'),
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Actualités'),
              onTap: () => context.go('/news'),
            ),
            ListTile(
              leading: const Icon(Icons.replay),
              title: const Text('Replay'),
              onTap: () => context.go('/replay'),
            ),
            ListTile(
              leading: const Icon(Icons.radio),
              title: const Text('Radios'),
              onTap: () => context.go('/radios'), 
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Bienvenue sur RTS')),
    );
  }
}
