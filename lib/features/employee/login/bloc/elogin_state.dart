part of 'elogin_bloc.dart';

sealed class EloginState extends Equatable {
  const EloginState();
  
  @override
  List<Object> get props => [];
}

final class EloginInitial extends EloginState {}
