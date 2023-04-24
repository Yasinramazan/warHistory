import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
