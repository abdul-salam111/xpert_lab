// To parse this JSON data, do
//
//     final testDetailsModel = testDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';



AddToCartModel testDetailsModelFromJson(String str) =>
    AddToCartModel.fromJson(json.decode(str));

String testDetailsModelToJson(AddToCartModel data) =>
    json.encode(data.toJson());

class AddToCartModel {
  String? testName;
  String? testPrice;

  String? added_By_Id;

  AddToCartModel({
    this.testName,
    this.testPrice,
    this.added_By_Id,
  });

  factory AddToCartModel.fromJson(DocumentSnapshot json) => AddToCartModel(
        testName: json["test_Name"],
        testPrice: json["test_Price"],
        added_By_Id: json['added_By_Id'],
      );

  Map<String, dynamic> toJson() => {
        "test_Name": testName,
        "test_Price": testPrice,
        "added_By_Id": added_By_Id,
      };
}
