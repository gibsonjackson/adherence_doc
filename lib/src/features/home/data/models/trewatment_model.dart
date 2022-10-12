import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/**
 * {
    "treatmentType": "striing",
    "treatmentName": "string",
    "doseAmount": "string",
    "frequency": "string"
}
 */

class TreatmentModel {
  String _treatmentType;
  String _treatmentName;
  String _doseAmount;
  String _frequency;
  String _repeatTill;
  String _description;

  TreatmentModel({
    @required String treatmentType,
    @required String treatmentName,
    @required String doseAmount,
    @required String frequency,
    String repeatTill,
    String desc
  }) {
    this._treatmentType = treatmentType;
    this._treatmentName = treatmentName;
    this._doseAmount = doseAmount;
    this._frequency = frequency;
    this._repeatTill = repeatTill;
    this._description = desc;
  }

  String get treatmentType => _treatmentType;
  set treatmentType(String treatmentType) => _treatmentType = treatmentType;
  String get treatmentName => _treatmentName;
  set treatmentName(String treatmentName) => _treatmentName = treatmentName;
  String get doseAmount => _doseAmount;
  set doseAmount(String doseAmount) => _doseAmount = doseAmount;
  String get frequency => _frequency;
  set frequency(String frequency) => _frequency = frequency;
  String get repeatTill => _repeatTill;
  set repeatTill(String repeatTill) => _repeatTill = repeatTill;
  String get description => _description;
  set description(String desc) => _description = desc;

  TreatmentModel.fromJson(Map<dynamic, dynamic> json) {
    _treatmentType = json['treatmentType'];
    _treatmentName = json['treatmentName'];
    _doseAmount = json['doseAmount'];
    _frequency = json['frequency'];
    _repeatTill = json['repeatTill'];
    _description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['treatmentType'] = this._treatmentType;
    data['treatmentName'] = this._treatmentName;
    data['doseAmount'] = this._doseAmount;
    data['frequency'] = this._frequency;
    data["repeatTill"] = this._repeatTill;
    data["description"] = this._description;
    return data;
  }

  TreatmentModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromJson(snapshot.data());
}
