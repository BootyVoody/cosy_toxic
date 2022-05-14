class AverageToxicState {
  final int averageLevel;

  AverageToxicState._({
    required this.averageLevel,
  });

  factory AverageToxicState.initial() => AverageToxicState._(averageLevel: 0);

  AverageToxicState copyWith({int? averageLevel}) => AverageToxicState._(
        averageLevel: averageLevel ?? this.averageLevel,
      );
}
