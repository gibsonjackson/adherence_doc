import 'package:adherence_doc/src/features/home/data/models/patient_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'cards/patient_card.dart';

class PatientsList extends StatelessWidget {
  final bool isSelectable;

  const PatientsList({Key key, this.isSelectable = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('patients').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Text("No users yet!");
        else if (snapshot.data.documents.length == 0)
          return Center(child: Text("No Patients yet!"));

        return _buildList(context, snapshot.data.documents);
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
