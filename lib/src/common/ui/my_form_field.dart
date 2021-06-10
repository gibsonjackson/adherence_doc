import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isNullable;
  final bool isEmail;
  final bool isPhone;
  final bool isDate;

  const MyFormField({
    Key key,
    @required this.title,
    @required this.controller,
    this.isNullable = false,
    this.isEmail = false,
    this.isPhone = false,
    this.isDate = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        onTap: () async {
          if (isDate) {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            ).then((value) {
              if (value != null) {
                controller.text = DateFormat("dd/MM/yyyy").format(value);
                FocusScope.of(context).unfocus();
              }
            });
          }
        },
        readOnly: isDate,
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
          disabledBorder: OutlineInputBorder(
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
              return Strings.FIELD_REQUIRED;
            }
          }

          return null;
        },
      ),
    );
  }
}
