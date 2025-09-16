import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'emi_event.dart';
part 'emi_state.dart';


class EmiBloc extends Bloc<EmiEvent, EmiState> {
  EmiBloc() : super(const EmiState(emiCount: 0)) {
    on<UpdateEmiCount>((event, emit) {
      emit(EmiState(emiCount: event.count));
    });
  }
}

