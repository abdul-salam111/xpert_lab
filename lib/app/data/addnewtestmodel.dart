import 'package:cloud_firestore/cloud_firestore.dart';

class TestModel {
  String? testName;
  String? referenceRange;
  String? testPrice;
  String? testDescription;
  String? sampleCollectionInstruction;
  String? sampleType;
  String? relevantDiseases;
  String? turnaroundTime;

  // Constructor
  TestModel({
    this.testName,
    this.referenceRange,
    this.testPrice,
    this.testDescription,
    this.sampleCollectionInstruction,
    this.sampleType,
    this.relevantDiseases,
    this.turnaroundTime,
  });

  // Factory method to create a model instance from a map (usually used for parsing JSON data)
  factory TestModel.fromJson(QueryDocumentSnapshot json) {
    return TestModel(
      testName: json['testName'],
      referenceRange: json['referenceRange'],
      testPrice: json['testPrice'],
      testDescription: json['testDescription'],
      sampleCollectionInstruction: json['sampleCollectionInstruction'],
      sampleType: json['sampleType'],
      relevantDiseases: json['relevantDiseases'],
      turnaroundTime: json['turnaroundTime'],
    );
  }

  // Method to convert the model instance to a map (usually used for converting to JSON data)
  Map<String, dynamic> toJson() {
    return {
      'testName': testName,
      'referenceRange': referenceRange,
      'testPrice': testPrice,
      'testDescription': testDescription,
      'sampleCollectionInstruction': sampleCollectionInstruction,
      'sampleType': sampleType,
      'relevantDiseases': relevantDiseases,
      'turnaroundTime': turnaroundTime,
    };
  }
}
