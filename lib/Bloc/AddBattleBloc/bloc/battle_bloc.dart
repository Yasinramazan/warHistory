import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Entities/Battles.dart';

part 'battle_event.dart';
part 'battle_state.dart';

class BattleBloc extends Bloc<BattleEvent, BattleState> {
  BattleBloc() : super(BattleInitialState()) {
    on<ListBattleEvent>(_onBattleEvent);
  }

  FutureOr<void> _onBattleEvent(
      ListBattleEvent event, Emitter<BattleState> emit) {
    List<Battle> battles = event.battles.toList();
    var result = BattleListState(battles: battles);
    emit(result);
  }
}
