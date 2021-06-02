import 'package:adherence_doc/src/common/ui/my_button.dart';
import 'package:adherence_doc/src/common/ui/my_drodown_field.dart';
import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:flutter/material.dart';

class AddTreatmentPage extends StatefulWidget {
  @override
  _AddTreatmentPageState createState() => _AddTreatmentPageState();
}

class _AddTreatmentPageState extends State<AddTreatmentPage> {
  final _addTreatmentFormKey = GlobalKey<FormState>();
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

  TextEditingController _ = TextEditingController(),
      _nameController = TextEditingController(),
      _desController = TextEditingController(),
      _phoneController = TextEditingController(),
      _clinicController = TextEditingController(),
      _awsmCont5roller = TextEditingController(text: "awsm");

  String _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Treatment"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Form(
          key: _addTreatmentFormKey,
          child: Column(
            children: [
              MyDropdownField(),
              MyButton(
                foo: () => print(_awsmCont5roller.text),
                title: "AWSM",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
