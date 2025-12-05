import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});
  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<NewsProvider>().load());
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<NewsProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Actualité')),
      body: vm.loading
          ? const Center(child: CircularProgressIndicator())
          : vm.error != null
          ? Center(child: Text(vm.error!))
          : ListView.builder(
              itemCount: vm.items.length,
              itemBuilder: (_, i) => NewsCard(n: vm.items[i]),
            ),
    );
  }
}
