import 'package:flutter/material.dart';
import 'package:school/bloc/splash_screen_bloc.dart';
import 'package:school/tools/bloc_provider.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenBloc bloc = SplashScreenBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      bloc: bloc,
      child: Center(
        child: Text('METRIC'),
      ),
    ));
  }
}
