import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('RTS')),
          ListTile(
            title: const Text('Accueil'),
            onTap: () => context.go('/home'),
          ),
          ListTile(
            title: const Text('Télévision'),
            onTap: () => context.go('/programs'),
          ),
          ListTile(
            title: const Text('Actualité'),
            onTap: () => context.go('/news'),
          ),
          ListTile(
            title: const Text('Replay'),
            onTap: () => context.go('/replay'),
          ),
        ],
      ),
    );
  }
}
