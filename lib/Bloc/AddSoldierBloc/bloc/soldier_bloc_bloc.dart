import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../Entities/Soldiers.dart';
import '../../../Services/soldierService.dart';
part 'soldier_bloc_event.dart';
part 'soldier_bloc_state.dart';

class SoldierBlocBloc extends Bloc<SoldierBlocEvent, SoldierBlocState> {
  SoldierBlocBloc() : super(ChangeColorInitial([Colors.white])) {
    on<ChangeColor>(_onChangeColor);
  }

  FutureOr<void> _onChangeColor(
      ChangeColor event, Emitter<SoldierBlocState> emit) {
    List<Color> colors = event.colors.toList();
    int index = event.index;
    List<bool> isSelected = event.isSelected.toList();
    var result = ChangeColorState(colors, index, isSelected);

    emit(result);
  }
}

class RefreshSoldierBloc extends Bloc<SoldierBlocEvent, SoldierBlocState> {
  RefreshSoldierBloc() : super(RefreshSoldierInitialState([])) {
    on<RefreshSoldierEvent>(_onRefreshSoldiers);
    on<RefreshSoldierEmptyEvent>(_onInitialSoldiers);
  }

  FutureOr<void> _onRefreshSoldiers(
      RefreshSoldierEvent event, Emitter<SoldierBlocState> emit) async {
    List<Soldier> soldiers = await getSoldiers();
    var result = RefreshSoldierPageState(soldiers);
    emit(result);
  }

  FutureOr<void> _onInitialSoldiers(
      RefreshSoldierEmptyEvent event, Emitter<SoldierBlocState> emit) {
    var result = RefreshSoldierInitialState([]);
    emit(result);
  }

  Future<List<Soldier>> getSoldiers() async {
    SoldiersService soldiersService = SoldiersService();
    return await soldiersService.getSoldiers();
  }
}
