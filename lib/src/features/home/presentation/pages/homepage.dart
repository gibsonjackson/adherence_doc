import 'package:adherence_doc/src/features/home/presentation/widgets/patients_list.dart';
import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.APP_NAME),
      ),
      body: PatientsList(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: accentColor,
      // ),
    );
  }
}
