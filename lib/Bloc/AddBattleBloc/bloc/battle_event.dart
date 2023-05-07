part of 'battle_bloc.dart';

@immutable
abstract class BattleEvent {}

class ListBattleEvent extends BattleEvent {
  ListBattleEvent({required this.battles});
  List<Battle> battles;
}
