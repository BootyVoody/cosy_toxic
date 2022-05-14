class AverageToxicState {
  final int? averageLevel;

  AverageToxicState._({
    this.averageLevel,
  });

  factory AverageToxicState.initial() => AverageToxicState._();

  AverageToxicState copyWith({int? averageLevel}) => AverageToxicState._(
        averageLevel: averageLevel ?? this.averageLevel,
      );
}
