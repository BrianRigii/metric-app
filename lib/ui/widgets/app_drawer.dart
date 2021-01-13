import 'package:flutter/material.dart';
import 'package:school/bloc/app_drawer_bloc.dart';
import 'package:school/tools/bloc_provider.dart';

class AppDrawer extends StatelessWidget {
  final AppDrawerBloc bloc = AppDrawerBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: bloc,
      child: Container(
          child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          ListTile(
            title: Text('Log Out'),
            trailing: Icon(Icons.power_settings_new_outlined),
            onTap: () => bloc.logOutBtnFunc(),
          )
        ],
      )),
    );
  }
}
