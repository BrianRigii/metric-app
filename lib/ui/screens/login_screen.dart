import 'package:flutter/material.dart';
import 'package:school/bloc/login_bloc.dart';
import 'package:school/bloc/splash_screen_bloc.dart';
import 'package:school/helpers/auth_manager.dart';
import 'package:school/tools/bloc_provider.dart';
import 'package:school/ui/widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = LoginBloc();
    return Scaffold(
        body: BlocProvider(
      bloc: bloc,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Metric'),
            SizedBox(height: 10),
            TextInput(
              label: "E-mail",
              controller: emailController,
            ),
            SizedBox(height: 10),
            TextInput(
              label: 'password',
              controller: passwordController,
            ),
            SizedBox(height: 10),
            FlatButton(
                child: Text('LOGIN'),
                onPressed: () {
                  print(emailController.text);
                  bloc.login(
                      email: emailController.text,
                      password: passwordController.text);
                },
                minWidth: 400,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white),
          ],
        ),
      ),
    ));
  }
}
