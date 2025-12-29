class Decision {
  final String title;
  final List<DecisionOption> options;

  Decision({
    required this.title,
    required this.options,
  });
}

class DecisionOption {
  final String label;
  final int healthChange;
  final int energyChange;
  final int moneyChange;
  final int careerChange;
  final int happinessChange;

  DecisionOption({
    required this.label,
    this.healthChange = 0,
    this.energyChange = 0,
    this.moneyChange = 0,
    this.careerChange = 0,
    this.happinessChange = 0,
  });
}
