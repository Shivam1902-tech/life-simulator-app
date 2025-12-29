import 'package:flutter/material.dart';

import '../models/life_stats.dart';
import '../common_widgets/stat_bar.dart';
import '../data/decisions.dart';
import '../data/life_storage.dart';
import 'decision_screen.dart';

class DashboardScreen extends StatefulWidget {
  final LifeStats stats;

  const DashboardScreen({super.key, required this.stats});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late LifeStats stats;

  @override
  void initState() {
    super.initState();
    stats = widget.stats;
  }

  // 🔁 RESET CONFIRMATION
  void _confirmReset() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Reset Life?'),
        content: const Text(
          'This will erase all progress and start from Day 1.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await LifeStorage.clearLife();
              setState(() {
                stats = LifeStats.initial();
              });
              Navigator.pop(context);
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  centerTitle: true,
  actions: [
    IconButton(
      icon: const Icon(Icons.restart_alt),
      onPressed: _confirmReset,
    ),
  ],
),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 LOGO + APP NAME + QUOTE
            Center(
  child: Column(
    children: const [
      Text(
        'Life Simulator',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: 6),
      Text(
        'Every choice has a cost.',
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    ],
  ),
),
const SizedBox(height: 32),


            // 🔹 DAY
            Text(
              'Day ${stats.day}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),

            // 🔹 STATS
            StatBar(label: 'Health', value: stats.health),
            StatBar(label: 'Energy', value: stats.energy),
            StatBar(label: 'Money', value: stats.money),
            StatBar(label: 'Career', value: stats.career),
            StatBar(label: 'Happiness', value: stats.happiness),

            const Spacer(),

SafeArea(
  top: false,
  child: Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: stats.energy <= 0
            ? null
            : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DecisionScreen(
                      stats: stats,
                      decision:
                          decisions[stats.day % decisions.length],
                    ),
                  ),
                ).then((_) {
                  setState(() {});
                });
              },
        child: const Text('Make Today’s Choice'),
      ),
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}

