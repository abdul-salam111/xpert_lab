import 'package:flutter/foundation.dart';
import 'package:xpert_lab/app/data/supplier.dart';

class Invoice {
  final PatientDetails patientDetails;
  final comments;

  final String reports;
  final Uint8List logo;
  final totalAmount;
  const Invoice({
    required this.logo,

    required this.comments,
    required this.patientDetails,
    required this.totalAmount,
    required this.reports,
  });
}

class Reports {
  final String testName;
  final String normalRange;
  final String units;
  final String results;

  const Reports({
    required this.testName,
    required this.normalRange,
    required this.units,
    required this.results,
  });
}
