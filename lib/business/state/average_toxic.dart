import 'package:bloc/bloc.dart';
import 'package:cosy_toxicity/business/state/average_toxic_state.dart';
import 'package:cosy_toxicity/services/toxicity_level_service.dart';

class AverageToxicCubit extends Cubit<AverageToxicState> {
  final ToxicityLevelService _toxicityLevelService =
      const ToxicityLevelService();

  AverageToxicCubit() : super(AverageToxicState.initial()) {
    _getAverageToxicData();
  }

  Future<void> _getAverageToxicData() async {
    final result = await _toxicityLevelService.getToxicityLevel();

    return emit(state.copyWith(averageLevel: result));
  }

  void reloadData() {
    emit(AverageToxicState.initial());

    _getAverageToxicData();
  }
}
