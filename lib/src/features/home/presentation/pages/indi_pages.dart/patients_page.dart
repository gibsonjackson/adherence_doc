import 'package:adherence_doc/src/common/ui/my_button.dart';
import 'package:adherence_doc/src/common/ui/my_table_row.dart';
import 'package:adherence_doc/src/features/home/data/models/patient_model.dart';
import 'package:adherence_doc/src/features/home/data/models/trewatment_model.dart';
import 'package:adherence_doc/src/features/home/presentation/pages/indi_pages.dart/add_treatment.dart';
import 'package:adherence_doc/src/features/home/presentation/widgets/cards/treatment_card.dart';
import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        mainAxisSize: MainAxisSize.min,
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
          Expanded(child: SingleChildScrollView(child: _treatmentsList())),
        ],
      ),
    );
  }

  Widget _treatmentsList() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('patients')
          .where("email", isEqualTo: patientModel.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Text("No Treatments yet!");
        else if (snapshot.data.documents.length == 0)
          return Text("No Treatments yet!");

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final PatientModel patientModel = PatientModel.fromSnapshot(data);
    print(data.data);
    if (patientModel.treatments != null && patientModel.treatments.length > 0) {
      return ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: patientModel.treatments
            .map(
              (e) => TreatmentCard(treatmentModel: e),
            )
            .toList(),
      );
    }

    return Text("No Treatments added!");
  }
}
