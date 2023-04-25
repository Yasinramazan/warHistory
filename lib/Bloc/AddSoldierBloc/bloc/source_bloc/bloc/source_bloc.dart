import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'source_event.dart';
part 'source_state.dart';

class SourceBloc extends Bloc<SourceEvent, SourceState> {
  SourceBloc() : super(AddSourceTextFieldInitial()) {
    on<AddSourceEvent>(_addSource);
  }

  FutureOr<void> _addSource(AddSourceEvent event, Emitter<SourceState> emit) {
    int count = event.count;
    var result = AddSourceTextFieldState(count);
    emit(result);
  }
}
