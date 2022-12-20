// To parse this JSON data, do
//
//     final patientModel = patientModelFromJson(jsonString);

import 'dart:convert';

PatientModel patientModelFromJson(String str) =>
    PatientModel.fromJson(json.decode(str));

String patientModelToJson(PatientModel data) => json.encode(data.toJson());

class PatientModel {
  PatientModel({
    required this.patients,
  });

  List<Patient> patients;

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        patients: List<Patient>.from(
            json["patients"].map((x) => Patient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "patients": List<dynamic>.from(patients.map((x) => x.toJson())),
      };
}

class Patient {
  Patient({
    required this.id,
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
    required this.patientAddress,
    required this.patientPayment,
    required this.departmentName,
    required this.doctorName,
  });

  int id;
  String patientName;
  String patientAge;
  String patientGender;
  String patientAddress;
  String patientPayment;
  String departmentName;
  String doctorName;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        patientName: json["patient_name"] ?? "",
        patientAge: json["patient_age"] ?? "",
        patientGender: json["patient_gender"] ?? "",
        patientAddress: json["patient_address"] ?? "",
        patientPayment: json["patient_payment"] ?? "",
        departmentName: json["department_name"] ?? "",
        doctorName: json["doctor_name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patient_name": patientName,
        "patient_age": patientAge,
        "patient_gender": patientGender,
        "patient_address": patientAddress,
        "patient_payment": patientPayment,
        "department_name": departmentName,
        "doctor_name": doctorName,
      };
}
