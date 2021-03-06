import 'package:flutter/material.dart';
import 'package:school/config.dart';
import 'package:school/models/task_model.dart';
import 'package:school/ui/widgets/badge.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard(this.task);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Card(
        elevation: 1,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.description,
                  style: TextStyle(
                      color: config.bluePurple, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 5,
              ),
              Badge(
                color: Colors.green,
                text: task.type,
              ),
              Spacer(),
              Text('Due Date'),
              Text('20 Jan')
            ],
          ),
        ),
      ),
    );
  }
}
