import 'package:billiard_score_app/domain/interactor/match/match_interactor.dart';

class MatchInteractorImpl implements MatchInteractor {
  @override
  int incrementMatchProperty(int incrementor, int incrementBy) {
    return incrementor + incrementBy;
  }

  @override
  int decrementMatchProperty(int decrementor, int decrementBy) {
    if (decrementor < decrementBy) return 0;
    return decrementor - decrementBy;
  }
}
