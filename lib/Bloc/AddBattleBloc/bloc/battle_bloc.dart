import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'battle_event.dart';
part 'battle_state.dart';

class BattleBloc extends Bloc<BattleEvent, BattleState> {
  BattleBloc() : super(BattleInitial()) {
    on<BattleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
