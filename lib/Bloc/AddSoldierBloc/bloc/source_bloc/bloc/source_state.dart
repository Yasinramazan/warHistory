part of 'source_bloc.dart';

@immutable
abstract class SourceState {}

class AddSourceTextFieldInitial extends SourceState {
  AddSourceTextFieldInitial();
  int count = 1;
}

class AddSourceTextFieldState extends SourceState {
  AddSourceTextFieldState(this.count);
  int count;
}
