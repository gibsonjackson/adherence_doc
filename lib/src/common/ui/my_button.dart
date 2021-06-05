import 'package:adherence_doc/src/utils/res/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function foo;
  final String title;

  const MyButton({
    Key key,
    @required this.foo,
    @required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(accentColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
              onPressed: foo,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(title),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
