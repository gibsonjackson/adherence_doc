import 'package:adherence_doc/src/features/home/data/models/trewatment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirebaseHomeProvider {
  final FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  Future<void> addUser(Map<dynamic, dynamic> userMap) async {
    DocumentReference ref =
        await databaseReference.collection("users").add(userMap);
    print(ref.id);
  }

  Future<void> addDoctor(Map<dynamic, dynamic> doctorMap) async {
    DocumentReference ref =
        await databaseReference.collection("doctors").add(doctorMap);
    print(ref.id);
  }

  Future<void> addPatient(Map<dynamic, dynamic> patientMap) async {
    DocumentReference ref =
        await databaseReference.collection("patients").add(patientMap);
    print(ref.id);
  }

  // void getData() {
  //   databaseReference
  //       .collection("books")
  //       .getDocuments()
  //       .then((QuerySnapshot snapshot) {
  //     snapshot.documents.forEach((f) => print('${f.data}}'));
  //   });
  // }

  // void updateData() {
  //   try {
  //     databaseReference
  //         .collection('books')
  //         .document('1')
  //         .updateData({'description': 'Head First Flutter'});
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // void deleteData() {
  //   try {
  //     databaseReference.collection('books').document('1').delete();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<void> addDoctorToPatient(
      String patientEmail, String doctorEmail) async {
    print("aaa");
    await databaseReference
        .collection('patients')
        .where('email', isEqualTo: patientEmail)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) {
        print(f.data);
        databaseReference
            .collection('patients')
            .doc(f.id)
            .update({"doctor": doctorEmail});
      });
    });
  }

  Future<void> addTreatmentToPatient(
    String patientEmail,
    TreatmentModel treatmentModel,
  ) async {
    print("aaa");
    await databaseReference
        .collection('patients')
        .where('email', isEqualTo: patientEmail)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) {
        print(f.data);
        databaseReference.collection('patients').doc(f.id).update({
          "treatments": FieldValue.arrayUnion([treatmentModel.toJson()])
        });
      });
    });
  }

  Future<void> deleteTreatmentFromPatient(
    String patientEmail,
    TreatmentModel treatmentModel,
  ) async {
    print("aaa");
    await databaseReference
        .collection('patients')
        .where('email', isEqualTo: patientEmail)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) {
        print(f.data);
        databaseReference.collection('patients').doc(f.id).update({
          "treatments": FieldValue.arrayRemove([treatmentModel.toJson()])
        });
      });
    });
  }

  Future<void> editTreatment({
    @required String patientEmail,
    @required TreatmentModel oldTreatmentModel,
    @required TreatmentModel updatedTreatmentModel,
  }) async {
    await deleteTreatmentFromPatient(patientEmail, oldTreatmentModel)
        .then((value) async {
      await addTreatmentToPatient(patientEmail, updatedTreatmentModel)
          .then((value) {
        return;
      });
    });
  }
}
