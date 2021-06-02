import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:flutter/material.dart';

class MyDropdownField extends StatefulWidget {
  const MyDropdownField({Key key}) : super(key: key);

  @override
  _MyDropdownFieldState createState() => _MyDropdownFieldState();
}

class _MyDropdownFieldState extends State<MyDropdownField> {
  String _currentSelectedValue;

  var _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide(
                color: accentColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide(
                color: grey,
              ),
            ),
            isDense: true,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text("awsm"),
              value: _currentSelectedValue,
              focusColor: accentColor,
              isDense: true,
              onChanged: (String newValue) {
                setState(() {
                  _currentSelectedValue = newValue;
                  state.didChange(newValue);
                });
              },
              items: _currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
