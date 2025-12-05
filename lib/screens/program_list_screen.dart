import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/program_provider.dart';
import '../widgets/program_card.dart';

class ProgramListScreen extends StatefulWidget {
  const ProgramListScreen({super.key});
  @override
  State<ProgramListScreen> createState() => _ProgramListScreenState();
}

class _ProgramListScreenState extends State<ProgramListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ProgramProvider>().load());
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProgramProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Programmes TV')),
      body: vm.loading
          ? const Center(child: CircularProgressIndicator())
          : vm.error != null
          ? Center(child: Text(vm.error!))
          : ListView.builder(
              itemCount: vm.programs.length,
              itemBuilder: (_, i) => ProgramCard(p: vm.programs[i]),
            ),
    );
  }
}
