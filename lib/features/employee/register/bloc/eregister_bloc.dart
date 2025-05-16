import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skilllink/features/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:skilllink/core/common/custom_snackbar.dart';

part 'eregister_event.dart';
part 'eregister_state.dart';

class EregisterBloc extends Bloc<EregisterEvent, EregisterState> {
  final AuthRepository _authRepository;
  final GlobalKey<NavigatorState> navigatorKey;

  EregisterBloc({required AuthRepository authRepository, required this.navigatorKey})
      : _authRepository = authRepository,
        super(EregisterInitial()) {
    on<EregisterSubmitted>(_onEregisterSubmitted);
  }

  Future<void> _onEregisterSubmitted(
    EregisterSubmitted event,
    Emitter<EregisterState> emit,
  ) async {
    emit(EregisterLoading());
    try {
      final result = await _authRepository.registerEmployee(
        event.companyName,
        event.email,
        event.password,
      );
      emit(EregisterSuccess(result: result));
    } catch (error) {
      emit(EregisterFailure(error: error.toString()));
      CustomSnackbar.show(
        context: navigatorKey.currentContext!,
        text: error.toString(),
        background: Colors.red,
        textcolor: Colors.white,
        position: 80,
      );
    }
  }
}