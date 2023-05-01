part of 'soldier_bloc_bloc.dart';

@immutable
abstract class SoldierBlocState {}

class ChangeColorInitial extends SoldierBlocState {
  ChangeColorInitial(
    this.colors,
  );
  List<Color> colors;
}

class ChangeColorState extends SoldierBlocState {
  ChangeColorState(this.colors, this.index, this.isSelected) {}
  List<Color> colors;
  int index;
  List<bool> isSelected;
}

class RefreshSoldierInitialState extends SoldierBlocState {
  RefreshSoldierInitialState(this.soldiers);
  List<Soldier> soldiers;
}

class RefreshSoldierPageState extends SoldierBlocState {
  RefreshSoldierPageState(this.soldiers);
  List<Soldier> soldiers;
}
