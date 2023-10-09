import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otonomus_ui_package/exports/app_colors_library.dart';
import 'package:otonomus_ui_package/exports/buttons_widgets_library.dart';
import 'package:otonomus_ui_package/exports/global_widgets_library.dart';
import 'package:otonomus_ui_package/exports/sizer.dart';
import 'package:task1/busniss_logic/sign_in_bloc/sign_in_bloc.dart';
import 'package:task1/data/enums/enums.dart';
import 'package:task1/presentation/shared_widgets/loading/loading_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => SignInBloc())],
      child: ResponsiveSizer(
          givenHeight: 804,
          givenWidth: 390,
          builder: (context, orientation, screenType) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const SignIn(),
            );
          }),
    );
  }
}

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      haveBlackBackgound: true,
      appBarBackgroundColor: Theme.of(context).primaryColorDark,
      scaffoldBackgroundColor: Theme.of(context).primaryColorLight,
      body: BlocListener<SignInBloc, SignInState>(
        listenWhen: (previous, current) =>
            previous.signInStatus != current.signInStatus,
        listener: (context, state) {
          print(state.email + "  " + state.password);
        },
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            bool buttonClick = !(state.email == "" || state.password == "");
            bool obscurePass = state.obscurePass;
            return Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: Column(
                          children: [
                            EmailTextfieldWidget(
                              hint: "Enter your Email",
                              isValid: true,
                              onChnaged: (val) {
                                BlocProvider.of<SignInBloc>(context)
                                    .add(OnChangeEmail(val));
                              },
                            ),
                            PasswordTextfieldWidget(
                              hint: "Enter your password",
                              isValid: true,
                              isObscureText: obscurePass,
                              onChnaged: (val) {
                                BlocProvider.of<SignInBloc>(context)
                                    .add(OnChangePassword(val));
                              },
                              ontap: () {
                                BlocProvider.of<SignInBloc>(context)
                                    .add(OnToggleObscurePassword());
                              },
                            ),
                          ],
                        ),
                      ),
                      BlueButton(
                        buttonText: "Sign In",
                        onPressed: () => {
                          BlocProvider.of<SignInBloc>(context)
                              .add(OnSignInSubmit())
                        },
                        isActive: buttonClick,
                      )
                    ],
                  ),
                ),
                Positioned.fill(
                    child: state.signInStatus == SignInStatus.loading
                        ? LoadingWidget()
                        : SizedBox.shrink()),
              ],
            );
          },
        ),
      ),
    );
  }
}
