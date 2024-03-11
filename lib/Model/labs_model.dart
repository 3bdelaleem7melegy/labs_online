


import 'package:labs_online/Model/patient_model.dart';

class Analysis {
  final String? id;
  final String date;
  final String description;
  final Patient patient;
  final String type;

  Analysis({
     this.id,
    required this.type,
    required this.date,
    required this.patient,
    required this.description,
  });

  factory Analysis.formJson(Map<String, dynamic> json) {
    return Analysis(
      id: json['id'],
      type: json['type'],
      date: json['date']??'',
      description: json['description']??'',
      patient: Patient.formJson(json['patient']),
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "date": date,
      "type": type,
      "description": description,
      "patient": patient.toFireStore(),
    };
  }
}
