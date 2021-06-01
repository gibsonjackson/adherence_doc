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
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ),
            onPressed: foo,
            child: Text(title),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
