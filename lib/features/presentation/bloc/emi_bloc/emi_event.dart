part of 'emi_bloc.dart';

@immutable
abstract class EmiEvent {}

class UpdateEmiCount extends EmiEvent {
  final int count;

   UpdateEmiCount(this.count);
}
