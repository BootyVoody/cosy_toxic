import 'package:cosy_toxicity/api/get_average_toxicity_level.dart';

class ToxicityLevelService {
  const ToxicityLevelService();

  Future<int> getToxicityLevel() async {
    final response = await getAverageToxicityLevel();

    return response.averageLevel;
  }
}
