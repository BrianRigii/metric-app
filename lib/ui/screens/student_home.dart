import 'package:flutter/material.dart';
import 'package:school/bloc/student_home_bloc.dart';
import 'package:school/config.dart';
import 'package:school/helpers/auth_manager.dart';
import 'package:school/helpers/student_home_manager.dart';
import 'package:school/tools/bloc_provider.dart';
import 'package:school/ui/widgets/app_drawer.dart';
import 'package:school/ui/widgets/task_cards.dart';
import 'package:school/ui/widgets/todays_unit_card.dart';
import 'package:school/ui/widgets/unit_card.dart';

class StudentHome extends StatelessWidget {
  final StudentHomeBloc bloc = StudentHomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).canvasColor,
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: CircleAvatar(
                      child: Icon(Icons.person_outline),
                      maxRadius: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          authManager.userName,
                          style: TextStyle(
                            fontSize: 17,
                            color: config.bluePurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(authManager.regNum),
                      ]),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.notifications_none),
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
            preferredSize: Size.fromHeight(10),
          ),
        ),
        drawer: Drawer(
          child: AppDrawer(),
        ),
        body: BlocProvider(
            bloc: bloc,
            child: Container(
              padding: EdgeInsets.only(top: 16),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'TODAY CLASSES(4)',
                          style: TextStyle(
                              color: config.bluePurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        Spacer(),
                        Icon(Icons.more_vert_outlined,
                            color: Theme.of(context).accentColor)
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: studentHomeManager.todaysClasses.length > 0
                        ? Column(
                            children: studentHomeManager.todaysClasses
                                .map((unit) => TodaysUnitCard(unit))
                                .toList())
                        : Text('empty'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'TASKS(2)',
                          style: TextStyle(
                              color: config.bluePurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        Spacer(),
                        FlatButton(
                          child: Text('View All'),
                          onPressed: () {},
                          textColor: Theme.of(context).accentColor,
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: studentHomeManager.tasks
                            .map((task) => TaskCard(task))
                            .toList()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 16),
                    child: Text(
                      'Information Technology',
                      style: TextStyle(
                          color: config.bluePurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  Container(
                    height: 500,
                    color: Colors.white,
                    child: GridView.builder(
                        itemCount: studentHomeManager.units.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return UnitCard(studentHomeManager.units[index]);
                        }),
                  )
                ],
              ),
            )));
  }
}
