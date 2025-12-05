import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/radio_provider.dart';

class RadioListScreen extends StatefulWidget {
  const RadioListScreen({super.key});

  @override
  State<RadioListScreen> createState() => _RadioListScreenState();
}

class _RadioListScreenState extends State<RadioListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<RadioProvider>().load());
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RadioProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Radios disponibles')),
      body: vm.loading
          ? const Center(child: CircularProgressIndicator())
          : vm.error != null
          ? Center(child: Text(vm.error!))
          : ListView.builder(
              itemCount: vm.radios.length,
              itemBuilder: (context, index) {
                final radio = vm.radios[index];
                return ListTile(
                  leading: radio.logoUrl.isNotEmpty
                      ? Image.network(
                          radio.logoUrl,
                          width: 50,
                          height: 50,
                          errorBuilder: (_, __, ___) => const Icon(Icons.radio),
                        )
                      : const Icon(Icons.radio),
                  title: Text(radio.name),
                  subtitle: Text('${radio.frequency} • ${radio.description}'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () => context.go('/radio/${radio.id}'),
                );
              },
            ),
    );
  }
}
