part of 'eregister_bloc.dart';

abstract class EregisterEvent extends Equatable {
  const EregisterEvent();

  @override
  List<Object> get props => [];
}

class EregisterSubmitted extends EregisterEvent {
  final String companyName;
  final String email;
  final String password;

  const EregisterSubmitted({
    required this.companyName,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [companyName, email, password];
}
