part of 'soldier_bloc_bloc.dart';

@immutable
abstract class SoldierBlocEvent {
  const SoldierBlocEvent();
}

class ChangeColor extends SoldierBlocEvent {
  List<Color> colors;
  List<bool> isSelected;
  int index;
  ChangeColor(
      {required this.colors, required this.index, required this.isSelected});
}

class RefreshSoldierEvent extends SoldierBlocEvent {
  RefreshSoldierEvent(this.soldiers);
  List<Soldier> soldiers;
}

class RefreshSoldierEmptyEvent extends SoldierBlocEvent {
  RefreshSoldierEmptyEvent(this.soldiers);
  List<Soldier> soldiers;
}
