import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

class MyTableRow extends StatelessWidget {
  final String title, val;
  final bool isWeekVisible;
  final values = [
    false, // Sunday
    true, // Monday
    true, // Tuesday
    true, // Wednesday
    true, // Thursday
    true, // Friday
    false, // Saturday
  ];

  MyTableRow(this.title, this.val, {this.isWeekVisible = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: grey,
                ),
              ),
              isWeekVisible
                  ? Expanded(
                      child: FractionallySizedBox(
                        alignment: Alignment.centerRight,
                        //FIXME for websites 1/3 is a good ratio
                        widthFactor: 7.5 / 10,
                        child: SizedBox(
                          height: 20,
                          child: WeekdaySelector(
                            onChanged: (int day) {},
                            values: values,
                          ),
                        ),
                      ),
                    )
                  : Text(
                      val,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
