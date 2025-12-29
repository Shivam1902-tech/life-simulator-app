import '../data/life_storage.dart';
import 'package:flutter/material.dart';
import '../models/decision.dart';
import '../models/life_stats.dart';

class DecisionScreen extends StatelessWidget {
  final LifeStats stats;
  final Decision decision;

  const DecisionScreen({
    super.key,
    required this.stats,
    required this.decision,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Make a Choice')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              decision.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            ...decision.options.map(
              (option) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  onPressed: () async {
  stats.applyChange(
    healthChange: option.healthChange,
    energyChange: option.energyChange,
    moneyChange: option.moneyChange,
    careerChange: option.careerChange,
    happinessChange: option.happinessChange,
  );

  await LifeStorage.saveLife(stats);
  ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text('Decision applied. Day progressed.'),
    duration: Duration(seconds: 1),
  ),
);

  Navigator.pop(context);
},

                  child: Text(option.label),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
