part of 'source_bloc.dart';

@immutable
abstract class SourceEvent {}

class AddSourceEvent extends SourceEvent {
  AddSourceEvent({required this.count});
  int count;
}
