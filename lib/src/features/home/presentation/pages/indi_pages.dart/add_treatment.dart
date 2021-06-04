import 'package:adherence_doc/src/common/ui/my_button.dart';
import 'package:adherence_doc/src/common/ui/my_drodown_field.dart';
import 'package:adherence_doc/src/common/ui/my_form_field.dart';
import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:flutter/material.dart';

class AddTreatmentPage extends StatefulWidget {
  @override
  _AddTreatmentPageState createState() => _AddTreatmentPageState();
}

class _AddTreatmentPageState extends State<AddTreatmentPage> {
  final _addTreatmentFormKey = GlobalKey<FormState>();
  String _frequencySeletced, _treatmentTypeSelected;

  var _frequencyList = [
    "Daily",
    "Twice a Day",
    "Three times a day",
    "Four times a day",
    "Weekly",
    "Twice Weekly",
    "Three times a week",
  ];

  var _treatmentTypeList = [
    "Diet",
    "Fluid",
    "Medication",
    "Procedure",
  ];

  TextEditingController _nameController = TextEditingController(),
      _doseController = TextEditingController(),
      _phoneController = TextEditingController(),
      _clinicController = TextEditingController(),
      _awsmCont5roller = TextEditingController(text: "awsm");

  @override
  Widget build(BuildContext context) {
    addTreatment() {
      if (_addTreatmentFormKey.currentState.validate()) {}
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Treatment"),
        actions: [
          TextButton(
            child: Text(
              "ADD",
              style: TextStyle(color: white),
            ),
            onPressed: addTreatment,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Form(
            key: _addTreatmentFormKey,
            child: Column(
              children: [
                _dropdownSelector("TreatmentType", _treatmentTypeList),
                MyFormField(
                  title: "Enter Treatment Name",
                  controller: _nameController,
                ),
                MyFormField(
                  title: "Enter Dose Amount",
                  controller: _doseController,
                ),
                _dropdownSelector("Frequency", _frequencyList),
                MyButton(
                  foo: addTreatment,
                  title: "Add Treatment",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dropdownSelector(String setValue, List<String> dropdownList) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButtonFormField<String>(
        value: setValue == "Frequency"
            ? _frequencySeletced
            : _treatmentTypeSelected,
        hint: Text(setValue == "Frequency"
            ? "Select Frequency"
            : "Select Treatment Type"),
        focusColor: accentColor,
        isDense: true,
        onChanged: (String newValue) {
          setState(() {
            if (setValue == "Frequency")
              setState(() {
                _frequencySeletced = newValue;
              });
            else
              setState(() {
                _treatmentTypeSelected = newValue;
              });
          });
        },
        validator: (value) => value == null ? Strings.FIELD_REQUIRED : null,
        items: dropdownList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
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
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(bottom: 20),
    //   child: FormField<String>(
    //     builder: (FormFieldState<String> state) {
    // return InputDecorator(
    //   decoration: InputDecoration(
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(100.0),
    //       borderSide: BorderSide(
    //         color: accentColor,
    //       ),
    //     ),
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(100.0),
    //       borderSide: BorderSide(
    //         color: grey,
    //       ),
    //     ),
    //     isDense: true,
    //   ),
    // child: DropdownButtonHideUnderline(
    //   child: DropdownButton<String>(
    //     hint: Text(setValue == "Frequency"
    //         ? "Select Frequency"
    //         : "Select Treatment Type"),
    //     value: setValue == "Frequency"
    //         ? _frequencySeletced
    //         : _treatmentTypeSelected,
    //     focusColor: accentColor,
    //     isDense: true,
    //     onChanged: (String newValue) {
    //       setState(() {
    //         if (setValue == "Frequency")
    //           _frequencySeletced = newValue;
    //         else
    //           _treatmentTypeSelected = newValue;
    //         state.didChange(newValue);
    //       });
    //     },
    //     items: dropdownList.map((String value) {
    //               return DropdownMenuItem<String>(
    //                 value: value,
    //                 child: Text(value),
    //               );
    //             }).toList(),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
