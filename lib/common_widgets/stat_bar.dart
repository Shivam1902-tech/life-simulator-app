import 'package:flutter/material.dart';

class StatBar extends StatelessWidget {
  final String label;
  final int value;

  const StatBar({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: $value'),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: value / 100,
            minHeight: 8,
          ),
        ],
      ),
    );
  }
}
