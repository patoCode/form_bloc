import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Counter"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh_rounded),
          )
        ],
      ),
      body: const Center(
        child: Text("Counter bloc 0"),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Icon(
              Icons.work_rounded,
            ),
            onPressed: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: '2',
            child: const Icon(
              Icons.adobe_rounded,
            ),
            onPressed: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: '3',
            child: const Icon(
              Icons.workspaces_rounded,
            ),
            onPressed: () {},
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
