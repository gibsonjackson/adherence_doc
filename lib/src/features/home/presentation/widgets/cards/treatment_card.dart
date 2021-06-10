import 'package:adherence_doc/src/features/home/data/datasources/firebase_home_provider.dart';
import 'package:adherence_doc/src/features/home/data/models/trewatment_model.dart';
import 'package:adherence_doc/src/utils/res/colors.dart';
import 'package:flutter/material.dart';

class TreatmentCard extends StatelessWidget {
  final TreatmentModel treatmentModel;
  final String patientEmail;
  const TreatmentCard({
    Key key,
    @required this.treatmentModel,
    @required this.patientEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deleteTreatment() async {
      FirebaseHomeProvider firebaseHomeProvider = FirebaseHomeProvider();
      await firebaseHomeProvider
          .deleteTreatmentFromPatient(patientEmail, treatmentModel)
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Treatment Removed Successfully!',
            ),
            backgroundColor: successColor,
          ),
        );
      });
    }

    confirmDelete() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Remove Treatment"),
              content: Text("Are you sure you want to remove treatment " +
                  treatmentModel.treatmentName +
                  "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: error_color),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    deleteTreatment();
                  },
                  child: Text(
                    "Confirm",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            );
          });
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: ListTile(
            title: Text(treatmentModel.treatmentName),
            subtitle: Text(
                treatmentModel.doseAmount + ", " + treatmentModel.frequency),
            // leading: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(
            //       Icons.account_circle,
            //       size: 35,
            //     ),
            //   ],
            // ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.edit_outlined,
                    color: primaryColor,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    color: error_color,
                  ),
                  onPressed: confirmDelete,
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
