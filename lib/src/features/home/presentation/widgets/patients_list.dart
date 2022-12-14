import 'package:adherence_doc/src/features/home/data/models/patient_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'cards/patient_card.dart';

class PatientsList extends StatelessWidget {
  final bool isSelectable;
  final String doctorEmail;

  const PatientsList(
      {Key key, this.isSelectable = false, @required this.doctorEmail})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('patients')
          //FIXME get doctor email from login
          .where("doctor", isEqualTo: doctorEmail)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
              child: Text(
                  "No Patients yet! Ask your admin to add patients for you."));
        else if (snapshot.data.docs.length == 0)
          return Center(
              child: Text(
                  "No Patients yet! Ask your admin to add patients for you."));

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 10.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final patienModel = PatientModel.fromSnapshot(data);
    return PatientCard(
      patientModel: patienModel,
      isSelectable: isSelectable,
    );
  }
}
