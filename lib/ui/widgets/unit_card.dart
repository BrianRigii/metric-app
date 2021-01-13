import 'package:flutter/material.dart';
import 'package:school/config.dart';
import 'package:school/models/unit_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class UnitCard extends StatelessWidget {
  final UnitModel unit;
  UnitCard(this.unit);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.5,
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 0,
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(unit.name,
                          style: TextStyle(
                              color: config.bluePurple,
                              fontWeight: FontWeight.w700)),
                    ),
                    CircularPercentIndicator(
                      radius: 20,
                      progressColor: Theme.of(context).accentColor,
                      percent: 0.6,
                      lineWidth: 3.0,
                    )
                  ],
                ),
                Spacer(),
                Row(children: [
                  Icon(
                    Icons.class__rounded,
                    color: Colors.grey,
                    size: 15,
                  ),
                  Text(unit.room != null ? unit.room : "CLB 202"),
                  Spacer(),
                  Icon(
                    Icons.notes_outlined,
                    color: Colors.grey,
                    size: 15,
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
