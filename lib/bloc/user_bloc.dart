import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munch_flutter_assessment/models/index.dart';

//
// EVENTS
//
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserSelectEvent extends UserEvent {
  final User user;

  const UserSelectEvent(this.user);

  @override
  List<Object> get props => [user];
}

//
// STATE
//
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {}

class UserSelectedState extends UserState {
  final User user;

  const UserSelectedState(this.user);

  @override
  List<Object> get props => [user];
}

//
// BLOC
//
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<UserSelectEvent>((event, emit) {
      emit(UserSelectedState(event.user));
    });
  }
}
