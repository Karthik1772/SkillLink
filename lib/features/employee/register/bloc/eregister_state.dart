part of 'eregister_bloc.dart';

abstract class EregisterState extends Equatable {
  const EregisterState();

  @override
  List<Object> get props => [];
}

class EregisterInitial extends EregisterState {}

class EregisterLoading extends EregisterState {}

class EregisterSuccess extends EregisterState {
  //add result
  final dynamic result;
  const EregisterSuccess({required this.result});
}

class EregisterFailure extends EregisterState {
  final String error;

  const EregisterFailure({required this.error});

  @override
  List<Object> get props => [error];
}
