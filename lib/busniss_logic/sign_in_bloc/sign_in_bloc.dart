import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:task1/data/enums/enums.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<OnChangeEmail>(_onChangeEmail);
    on<OnChangePassword>(_onChangePassword);
    on<OnToggleObscurePassword>(_onToggleObscurePassword);
    on<OnSignInSubmit>(_onSignInSubmit);
  }
  void _onChangeEmail(OnChangeEmail event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onChangePassword(OnChangePassword event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onToggleObscurePassword(
      OnToggleObscurePassword event, Emitter<SignInState> emit) {
    emit(state.copyWith(obscurePass: !state.obscurePass));
  }

  void _onSignInSubmit(OnSignInSubmit event, Emitter<SignInState> emit) {
    emit(state.copyWith(signInStatus: SignInStatus.loading));
    Future.delayed(Duration(seconds: 3), () {
      emit(state.copyWith(signInStatus: SignInStatus.none));
    });
  }
}
