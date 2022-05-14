class AverageToxicLevelModel {
  final int averageLevel;

  const AverageToxicLevelModel({required this.averageLevel});

  factory AverageToxicLevelModel.fromJson(Map<String, dynamic> json) =>
      AverageToxicLevelModel(averageLevel: json['averageLevel'] as int);
}
