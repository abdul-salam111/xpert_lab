import 'package:cloud_firestore/cloud_firestore.dart';

class AddPackageModel {
  String? packageName;
  List<dynamic>? testNames = [];
  String? testActualPrice;
  String? discountedPrice;
  String? testDescription;
  String? sampleCollectionInstruction;
  String? sampleType;
  String? packageImage;
  String? turnaroundTime;

  // Constructor
  AddPackageModel({
    this.packageName,
    this.testNames,
    this.packageImage,
    this.testActualPrice,
    this.discountedPrice,
    this.testDescription,
    this.sampleCollectionInstruction,
    this.sampleType,
    this.turnaroundTime,
  });

  // Factory method to create a model instance from a map (usually used for parsing JSON data)
  factory AddPackageModel.fromJson(QueryDocumentSnapshot json) {
    return AddPackageModel(
      packageName: json['packageName'],
      testNames: json['testNames'],
      packageImage: json['packageImage'],
      testActualPrice: json['testActualPrice'],
      discountedPrice: json['discountedPrice'],
      testDescription: json['testDescription'],
      sampleCollectionInstruction: json['sampleCollectionInstruction'],
      sampleType: json['sampleType'],
      turnaroundTime: json['turnaroundTime'],
    );
  }

  // Method to convert the model instance to a map (usually used for converting to JSON data)
  Map<String, dynamic> toJson() {
    return {
      'packageName': packageName,
      'testNames': testNames,
      'discountedPrice': discountedPrice,
      'testActualPrice': testActualPrice,
      'testDescription': testDescription,
      'sampleCollectionInstruction': sampleCollectionInstruction,
      'sampleType': sampleType,
      'packageImage': packageImage,
      'turnaroundTime': turnaroundTime,
    };
  }
}
