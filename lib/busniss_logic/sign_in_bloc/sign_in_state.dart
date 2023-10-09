// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_bloc.dart';

@immutable
class SignInState extends Equatable {
  final String email;
  final String password;
  final bool obscurePass;
  final SignInStatus signInStatus;
  SignInState({
    this.email = "",
    this.password = "",
    this.obscurePass = true,
    this.signInStatus = SignInStatus.none,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, obscurePass, signInStatus];

  SignInState copyWith({
    String? email,
    String? password,
    bool? obscurePass,
    SignInStatus? signInStatus,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      obscurePass: obscurePass ?? this.obscurePass,
      signInStatus: signInStatus ?? this.signInStatus,
    );
  }
}
