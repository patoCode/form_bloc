import 'package:flutter/material.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit counter"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh_rounded),
          )
        ],
      ),
      body: const Center(
        child: Text("Counter cubits 0"),
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
