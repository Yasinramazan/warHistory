part of 'battle_bloc.dart';

@immutable
abstract class BattleState {}

class BattleInitialState extends BattleState {}

class BattleListState extends BattleState {
  BattleListState({required this.battles});
  List<Battle> battles;
}
