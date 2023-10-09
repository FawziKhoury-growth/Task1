// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class OnChangeEmail extends SignInEvent {
  final String email;
  const OnChangeEmail(
    this.email,
  );
  @override
  List<Object> get props => [email];
}

class OnChangePassword extends SignInEvent {
  final String password;
  const OnChangePassword(
    this.password,
  );
  @override
  List<Object> get props => [password];
}

class OnToggleObscurePassword extends SignInEvent {
  const OnToggleObscurePassword();
  @override
  List<Object> get props => [];
}

class OnSignInSubmit extends SignInEvent {
  const OnSignInSubmit();
  @override
  List<Object> get props => [];
}
