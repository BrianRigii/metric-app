import 'package:flutter/material.dart';
import 'package:school/models/unit_model.dart';

class TodaysUnitCard extends StatelessWidget {
  final UnitModel unit;
  TodaysUnitCard(this.unit);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Row(children: [
          Text('7:00'),
          VerticalDivider(),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(unit.name),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 10,
                  ),
                  Text('CLB 401')
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 10,
                  ),
                  Text(unit.lecturer)
                ],
              )
            ],
          ))
        ]),
      ),
    );
  }
}
