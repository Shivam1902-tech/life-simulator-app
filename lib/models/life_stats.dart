import 'dart:convert';

class LifeStats {
  int health;
  int energy;
  int money;
  int career;
  int happiness;
  int day;

  LifeStats({
    required this.health,
    required this.energy,
    required this.money,
    required this.career,
    required this.happiness,
    required this.day,
  });

  factory LifeStats.initial() {
    return LifeStats(
      health: 70,
      energy: 70,
      money: 50,
      career: 40,
      happiness: 60,
      day: 1,
    );
  }

  void applyChange({
    int healthChange = 0,
    int energyChange = 0,
    int moneyChange = 0,
    int careerChange = 0,
    int happinessChange = 0,
  }) {
    health = _clamp(health + healthChange);
    energy = _clamp(energy + energyChange);
    money = _clamp(money + moneyChange);
    career = _clamp(career + careerChange);
    happiness = _clamp(happiness + happinessChange);
    day += 1;
  }

  int _clamp(int value) {
    if (value < 0) return 0;
    if (value > 100) return 100;
    return value;
  }
}

/// STORAGE EXTENSION
extension LifeStatsStorage on LifeStats {
  Map<String, dynamic> toMap() {
    return {
      'health': health,
      'energy': energy,
      'money': money,
      'career': career,
      'happiness': happiness,
      'day': day,
    };
  }

  static LifeStats fromMap(Map<String, dynamic> map) {
    return LifeStats(
      health: map['health'],
      energy: map['energy'],
      money: map['money'],
      career: map['career'],
      happiness: map['happiness'],
      day: map['day'],
    );
  }

  String toJson() => jsonEncode(toMap());

  static LifeStats fromJson(String source) =>
      fromMap(jsonDecode(source));
}

