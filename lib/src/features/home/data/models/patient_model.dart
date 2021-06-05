import 'package:adherence_doc/src/features/home/data/models/trewatment_model.dart';
import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:adherence_doc/src/utils/res/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PatientModel {
  String _name;
  String _email;
  String _phone;
  String _doctor;
  ROLES _role;
  List<TreatmentModel> _treatments;

  PatientModel({
    String name,
    String email,
    String phone,
    ROLES role,
    String doctor,
    List<TreatmentModel> treatments,
  }) {
    this._name = name;
    this._email = email;
    this._phone = phone;
    this._role = role;
    this._doctor = doctor;
    this._treatments = treatments;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  ROLES get role => _role;
  set role(ROLES role) => _role = role;
  String get doctor => _doctor;
  set doctor(String doctor) => _doctor = doctor;
  List<TreatmentModel> get treatments => _treatments;
  set wallets(List<TreatmentModel> treatments) => _treatments = treatments;

  PatientModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _doctor = json['doctor'] != null ? json['doctor'] : "Not Assigned";
    if (json['treatments'] != null) {
      _treatments = [];
      json['treatments'].forEach((v) {
        _treatments.add(new TreatmentModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toUserJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['designation'] = "";
    data['role'] = Utils().getRole(this._role);
    if (this._treatments != null) {
      data['treatments'] = this._treatments.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toPatientJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['role'] = Utils().getRole(this._role);
    return data;
  }

  PatientModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromJson(snapshot.data);
}
