import 'package:cloud_firestore/cloud_firestore.dart';

class TestBooking {
  String? testBookingId;
  List<dynamic>? testNames;
  List<dynamic>? testPrices;
  String? booked_By_Id;
  String? added_By_Name;
  String? bookingDate;
  String? bookingTime;
  String? gender;
  String? totalBill;
  String? booked_By_Address;
  String? booked_By_Phone;
  String? status;
  DateTime? dataCreated;
  TestBooking(
      {this.testBookingId,
      this.testPrices,
      this.testNames,
      this.totalBill,
      this.gender,
      this.added_By_Name,
      this.booked_By_Address,
      this.booked_By_Id,
      this.booked_By_Phone,
      this.bookingDate,
      this.bookingTime,
      this.status,
      this.dataCreated});

  factory TestBooking.fromJson(DocumentSnapshot json) => TestBooking(
      testNames: json["testNames"] as List<dynamic>,
      testPrices: json["testPrices"] as List<dynamic>,
      totalBill: json["totalBill"],
      gender: json['gender'],
      added_By_Name: json["added_By_Name"],
      booked_By_Address: json["booked_By_Address"],
      booked_By_Id: json["booked_By_Id"],
      booked_By_Phone: json["booked_By_Phone"],
      bookingDate: json["bookingDate"],
      bookingTime: json["bookingTime"],
      testBookingId: json['testBookingId'],
      status: json['status'],
      dataCreated: json['dataCreated'].toDate());

  Map<String, dynamic> toJson() => {
        "testNames": testNames as List<String>,
        "testPrices": testPrices as List<String>,
        "added_By_Name": added_By_Name,
        "booked_By_Address": booked_By_Address,
        "booked_By_Id": booked_By_Id,
        'gender': gender,
        "booked_By_Phone": booked_By_Phone,
        "bookingDate": bookingDate,
        "bookingTime": bookingTime,
        "totalBill": totalBill,
        "testBookingId": testBookingId,
        "status": status,
        "dataCreated": dataCreated
      };
}
