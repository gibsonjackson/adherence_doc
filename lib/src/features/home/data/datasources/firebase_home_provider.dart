import 'package:adherence_doc/src/features/home/data/models/trewatment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHomeProvider {
  final Firestore databaseReference = Firestore.instance;

  Future<void> addUser(Map<dynamic, dynamic> userMap) async {
    DocumentReference ref =
        await databaseReference.collection("users").add(userMap);
    print(ref.documentID);
  }

  Future<void> addDoctor(Map<dynamic, dynamic> doctorMap) async {
    DocumentReference ref =
        await databaseReference.collection("doctors").add(doctorMap);
    print(ref.documentID);
  }

  Future<void> addPatient(Map<dynamic, dynamic> patientMap) async {
    DocumentReference ref =
        await databaseReference.collection("patients").add(patientMap);
    print(ref.documentID);
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
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        print(f.data);
        databaseReference
            .collection('patients')
            .document(f.documentID)
            .updateData({"doctor": doctorEmail});
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
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        print(f.data);
        databaseReference
            .collection('patients')
            .document(f.documentID)
            .updateData({
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
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        print(f.data);
        databaseReference
            .collection('patients')
            .document(f.documentID)
            .updateData({
          "treatments": FieldValue.arrayRemove([treatmentModel.toJson()])
        });
      });
    });
  }
}
