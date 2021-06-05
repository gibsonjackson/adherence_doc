import 'package:adherence_doc/src/common/ui/my_button.dart';
import 'package:adherence_doc/src/common/ui/my_table_row.dart';
import 'package:adherence_doc/src/features/home/data/models/patient_model.dart';
import 'package:adherence_doc/src/features/home/presentation/pages/indi_pages.dart/add_treatment.dart';
import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatelessWidget {
  final PatientModel patientModel;

  const PatientPage({Key key, this.patientModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    addTreatment() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddTreatmentPage(patientModel: patientModel),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Patient"),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Icon(
            Icons.account_circle,
            size: 60,
          ),
          SizedBox(height: 5),
          Text(
            patientModel.name,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: primaryColor,
                ),
          ),
          // SizedBox(height: 5),
          // Text(
          //   doctor.designation,
          //   style: Theme.of(context).textTheme.subtitle1.copyWith(
          //         color: accentColor,
          //       ),
          // ),
          SizedBox(height: 15),
          MyTableRow("Email", patientModel.email),
          MyTableRow("Phone", patientModel.phone),
          MyTableRow("Doctor", patientModel.doctor),
          MyButton(
            foo: addTreatment,
            title: "Add Treatment",
          ),
        ],
      ),
    );
  }
}
