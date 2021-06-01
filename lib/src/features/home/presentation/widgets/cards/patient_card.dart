import 'package:adherence_doc/src/features/home/data/models/patient_model.dart';
import 'package:adherence_doc/src/features/home/presentation/pages/indi_pages.dart/patients_page.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  final PatientModel patientModel;
  final bool isSelectable;

  const PatientCard({
    Key key,
    this.patientModel,
    this.isSelectable = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    openPatientPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PatientPage(patientModel: patientModel),
        ),
      );
    }

    selectCard() {
      Navigator.pop(context, patientModel.email);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: InkWell(
          onTap: isSelectable ? selectCard : openPatientPage,
          child: ListTile(
            title: Text(patientModel.name),
            subtitle:
                Text(isSelectable ? patientModel.doctor : patientModel.email),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 35,
                ),
              ],
            ),
            minLeadingWidth: 0,
          ),
        ),
      ),
    );
  }
}
