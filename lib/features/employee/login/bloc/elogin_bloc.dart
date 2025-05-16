import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'elogin_event.dart';
part 'elogin_state.dart';

class EloginBloc extends Bloc<EloginEvent, EloginState> {
  EloginBloc() : super(EloginInitial()) {
    on<EloginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
