import 'package:adherence_doc/src/features/home/data/models/trewatment_model.dart';
import 'package:adherence_doc/src/utils/res/colors.dart';
import 'package:flutter/material.dart';

class TreatmentCard extends StatelessWidget {
  final TreatmentModel treatmentModel;
  const TreatmentCard({
    Key key,
    @required this.treatmentModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(treatmentModel.doseAmount);
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
                  onPressed: () {},
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
