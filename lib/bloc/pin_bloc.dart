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

class PinEnteredEvent extends PinEvent {
  final String pin;

  const PinEnteredEvent(this.pin);

  @override
  List<Object> get props => [pin];
}

class ValidatePinEvent extends PinEvent {
  final String correctPin;

  const ValidatePinEvent(this.correctPin);

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
  PinBloc() : super(PinInitialState()) {
    on<PinEnteredEvent>((event, emit) {
      print('PIN ENTER');
      if (event.pin.length == 4) {
        print('PIN ENTER 1');
        emit(PinCompleteState(event.pin));
      } else {
        print('PIN ENTER 2');
        emit(PinEnteringState(event.pin));
      }
    });
    on<ValidatePinEvent>((event, emit) {
      print('Validate Pin');
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
