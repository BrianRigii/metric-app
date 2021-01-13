import 'package:flutter/material.dart';
import 'package:school/config.dart';
import 'package:school/models/unit_model.dart';

class TodaysUnitCard extends StatelessWidget {
  final UnitModel unit;
  TodaysUnitCard(this.unit);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: SizedBox(
                child: Text(
              '7:00 am',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )),
          ),
          VerticalDivider(),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(unit.name,
                  style: TextStyle(
                      color: config.bluePurple, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 10,
                  ),
                  Text('CLB 401')
                ],
              ),
              SizedBox(
                height: 5,
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
