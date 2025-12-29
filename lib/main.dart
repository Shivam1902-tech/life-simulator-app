import 'package:flutter/material.dart';

import 'data/life_storage.dart';
import 'models/life_stats.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const LifeSimulatorApp());
}

/// ROOT APP
class LifeSimulatorApp extends StatelessWidget {
  const LifeSimulatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Life Simulator',
      theme: ThemeData.dark(),
      home: FutureBuilder<LifeStats?>(
        future: LifeStorage.loadLife(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final stats = snapshot.data ?? LifeStats.initial();
          return DashboardScreen(stats: stats);
        },
      ),
    );
  }
}
