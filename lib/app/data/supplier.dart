class PatientDetails {
  final String name;
  final String address;
  final String testId;
  final String contactno;
  final String bookingDate;
  final String bookingTime;
  final String reportGeneratedDT;
  final String sex;

  const PatientDetails({
    required this.name,
    required this.address,
    required this.sex,
    required this.bookingDate,
    required this.bookingTime,
    required this.contactno,
    required this.reportGeneratedDT,
    required this.testId,
  });
}
