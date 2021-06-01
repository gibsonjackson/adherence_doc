import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:adherence_doc/src/utils/res/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PatientModel {
  String _name;
  String _email;
  String _phone;
  String _doctor;
  ROLES _role;

  PatientModel(
      {String name, String email, String phone, ROLES role, String doctor}) {
    this._name = name;
    this._email = email;
    this._phone = phone;
    this._role = role;
    this._doctor = doctor;
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

  PatientModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _doctor = json['doctor'] != null ? json['doctor'] : "Not Assigned";
  }

  Map<String, dynamic> toUserJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['designation'] = "";
    data['role'] = Utils().getRole(this._role);
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
