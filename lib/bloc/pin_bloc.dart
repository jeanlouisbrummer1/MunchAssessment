import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// EVENTS
//
abstract class PinEvent extends Equatable {
  const PinEvent();

  @override
  List<Object> get props => [];
}

class PinClearEvent extends PinEvent {
  const PinClearEvent();

  @override
  List<Object> get props => [];
}

class PinEnteredEvent extends PinEvent {
  final String pin;

  const PinEnteredEvent(this.pin);

  @override
  List<Object> get props => [pin];
}

class PinValidateEvent extends PinEvent {
  final String correctPin;

  const PinValidateEvent(this.correctPin);

  @override
  List<Object> get props => [correctPin];
}

//
// STATE
//

abstract class PinState extends Equatable {
  const PinState();

  @override
  List<Object> get props => [];
}

class PinInitialState extends PinState {
  const PinInitialState();
}

class PinEnteringState extends PinState {
  final String pin;

  const PinEnteringState(this.pin);

  @override
  List<Object> get props => [pin];
}

class PinCompleteState extends PinState {
  final String pin;

  const PinCompleteState(this.pin);

  @override
  List<Object> get props => [pin];
}

class PinValidState extends PinState {}

class PinInvalidState extends PinState {}

//
// BLOC
//
class PinBloc extends Bloc<PinEvent, PinState> {
  PinBloc() : super(const PinInitialState()) {
    on<PinClearEvent>((event, emit) {
      emit(const PinInitialState());
    });
    on<PinEnteredEvent>((event, emit) {
      if (event.pin.length == 4) {
        emit(PinCompleteState(event.pin));
      } else {
        emit(PinEnteringState(event.pin));
      }
    });
    on<PinValidateEvent>((event, emit) {
      if (state is PinCompleteState) {
        final currentState = state as PinCompleteState;
        if (currentState.pin == event.correctPin) {
          emit(PinValidState());
        } else {
          emit(PinInvalidState());
        }
      }
    });
  }
}
