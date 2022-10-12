import 'package:adherence_doc/src/common/ui/my_button.dart';
import 'package:adherence_doc/src/common/ui/my_drodown_field.dart';
import 'package:adherence_doc/src/common/ui/my_form_field.dart';
import 'package:adherence_doc/src/features/home/data/datasources/firebase_home_provider.dart';
import 'package:adherence_doc/src/features/home/data/models/patient_model.dart';
import 'package:adherence_doc/src/features/home/data/models/trewatment_model.dart';
import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:flutter/material.dart';

class AddTreatmentPage extends StatefulWidget {
  final String email;
  final TreatmentModel treatmentModel;
  final bool isEdit;

  const AddTreatmentPage({
    Key key,
    @required this.email,
    this.treatmentModel,
    this.isEdit = false,
  }) : super(key: key);
  @override
  _AddTreatmentPageState createState() => _AddTreatmentPageState();
}

class _AddTreatmentPageState extends State<AddTreatmentPage> {
  final _addTreatmentFormKey = GlobalKey<FormState>();
  String _frequencySeletced, _treatmentTypeSelected;
  bool isLoading = false;

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

  TextEditingController _nameController, _doseController, _repeatTillController,_descriptionController;

  @override
  void initState() {
    super.initState();
    _frequencySeletced = widget.treatmentModel?.frequency;
    _treatmentTypeSelected = widget.treatmentModel?.treatmentType;
    _nameController =
        TextEditingController(text: widget.treatmentModel?.treatmentName);
    _doseController =
        TextEditingController(text: widget.treatmentModel?.doseAmount);
    _repeatTillController =
        TextEditingController(text: widget.treatmentModel?.repeatTill);
    _descriptionController = TextEditingController(text: widget.treatmentModel?.description);

  }

  @override
  Widget build(BuildContext context) {
    addTreatment() async {
      if (_addTreatmentFormKey.currentState.validate()) {
        FirebaseHomeProvider firebaseHomeProvider = FirebaseHomeProvider();
        TreatmentModel treatmentModel = TreatmentModel(
          treatmentType: _treatmentTypeSelected,
          treatmentName: _nameController.text,
          doseAmount: _doseController.text,
          frequency: _frequencySeletced,
          repeatTill: _repeatTillController.text,
          desc: _descriptionController.text
        );
        setState(() {
          isLoading = true;
        });

        await firebaseHomeProvider
            .addTreatmentToPatient(
          widget.email,
          treatmentModel,
        )
            .then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Treatment Added Successfully!',
              ),
              backgroundColor: successColor,
            ),
          );
          Navigator.of(context).pop();
        });
      }
    }

    editTreatment() async {
      if (_addTreatmentFormKey.currentState.validate()) {
        FirebaseHomeProvider firebaseHomeProvider = FirebaseHomeProvider();
        TreatmentModel updatedTreatmentModel = TreatmentModel(
          treatmentType: _treatmentTypeSelected,
          treatmentName: _nameController.text,
          doseAmount: _doseController.text,
          frequency: _frequencySeletced,
          repeatTill: _repeatTillController.text,
          desc: _descriptionController.text
        );
        setState(() {
          isLoading = true;
        });

        await firebaseHomeProvider
            .editTreatment(
          patientEmail: widget.email,
          oldTreatmentModel: widget.treatmentModel,
          updatedTreatmentModel: updatedTreatmentModel,
        )
            .then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Treatment Updated Successfully!',
              ),
              backgroundColor: successColor,
            ),
          );
          Navigator.of(context).pop();
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? "Update Treatment" : "Add Treatment"),
        actions: [
          TextButton(
            child: Text(
              widget.isEdit ? "UPDATE" : "ADD",
              style: TextStyle(color: white),
            ),
            onPressed: widget.isEdit ? editTreatment : addTreatment,
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
                MyFormField(
                  title: "Repeat Till  (dd/mm/yyyy)",
                  isDate: true,
                  controller: _repeatTillController,
                ),
                MyFormField(
                  title: "Description",
                  controller: _descriptionController,
                ),
                MyButton(
                  foo: widget.isEdit ? editTreatment : addTreatment,
                  title: widget.isEdit ? "Update Treatment" : "Add Treatment",
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
