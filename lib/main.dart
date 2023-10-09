import 'package:flutter/material.dart';
import 'package:otonomus_ui_package/exports/app_colors_library.dart';
import 'package:otonomus_ui_package/exports/buttons_widgets_library.dart';
import 'package:otonomus_ui_package/exports/global_widgets_library.dart';
import 'package:otonomus_ui_package/exports/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
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
        });
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

  String _email = "";
  String _password = "";
  bool obscurePass = true;
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      haveBlackBackgound: true,
      appBarBackgroundColor: Theme.of(context).primaryColorDark,
      scaffoldBackgroundColor: Theme.of(context).primaryColorLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  EmailTextfieldWidget(
                    initialValue: _email,
                    hint: "Enter your Email",
                    isValid: true,
                    onChnaged: (val) {
                      _email = val;
                      setState(() {});
                    },
                  ),
                  PasswordTextfieldWidget(
                    initialValue: _password,
                    hint: "Enter yout password",
                    isValid: true,
                    isObscureText: obscurePass,
                    onChnaged: (val) {
                      _password = val;
                      setState(() {});
                    },
                    ontap: () {
                      setState(() {
                        obscurePass = !obscurePass;
                      });
                    },
                  ),
                ],
              ),
            ),
            BlueButton(
              buttonText: "Sign In",
              onPressed: () => {},
              isActive: _email == "" || _password == "" ? false : true,
            )
          ],
        ),
      ),
    );
  }
}
