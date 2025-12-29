import 'package:shared_preferences/shared_preferences.dart';
import '../models/life_stats.dart';

class LifeStorage {
  static const String _lifeKey = 'life_stats';

  static Future<void> saveLife(LifeStats stats) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lifeKey, stats.toJson());
  }

  static Future<LifeStats?> loadLife() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_lifeKey);
    if (data == null) return null;
    return LifeStatsStorage.fromJson(data);
  }

  static Future<void> clearLife() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_lifeKey);
  }
}
