import 'dart:convert';

import 'package:cosy_toxicity/api/models/average_toxic_level_model.dart';
import 'package:http/http.dart' as http;

Future<AverageToxicLevelModel> getAverageToxicityLevel() async {
  final uri = Uri.parse('http://172.105.91.137:8080/status');
  final request = await http.get(uri);
  final decodedRequest = jsonDecode(request.body);

  return AverageToxicLevelModel.fromJson(decodedRequest);
}
