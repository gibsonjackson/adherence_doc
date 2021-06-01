import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isNullable;
  final bool isEmail;
  final bool isPhone;

  const MyFormField(
      {Key key,
      this.title,
      this.controller,
      this.isNullable = false,
      this.isEmail = false,
      this.isPhone = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        textCapitalization:
            isEmail ? TextCapitalization.none : TextCapitalization.words,
        decoration: InputDecoration(
          isDense: true,
          labelText: title,
          focusedBorder: OutlineInputBorder(
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
        ),
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : isPhone
                ? TextInputType.phone
                : TextInputType.text,
        validator: (value) {
          if (!isNullable) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be left empty';
            }
          }

          return null;
        },
      ),
    );
  }
}
