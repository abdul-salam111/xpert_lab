import 'dart:convert';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../../data/invoice.dart';

class pdfInvoiceApi {
  static Future<File> generatepdf(Invoice invoice) async {
    final pdfdoucment = Document();
    pdfdoucment.addPage(MultiPage(
      build: (context) => [
        BuildHeader(invoice),
        Divider(),
        buildInvoice(invoice),
        Divider(),
        buildComment(invoice),
        Divider(),
        buildTotal(invoice),
      ],
      footer: (context) => buildFooter(),
    ));

    return PdfApi.saveDocument(name: 'myReports.pdf', pdf: pdfdoucment);
  }

  static Widget buildComment(Invoice invoice) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Comments:",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      SizedBox(height: 5),
      Text(invoice.comments)
    ]);
  }

  static BuildHeader(Invoice invoice) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image(MemoryImage(invoice.logo), width: 200.w, height: 100.h),
      SizedBox(height: 20),
      Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: "Patient Name: ",
                ),
                TextSpan(
                    text: invoice.patientDetails.name.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
              SizedBox(height: 5),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: "Sex: ",
                ),
                TextSpan(
                    text: invoice.patientDetails.sex.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
              SizedBox(height: 5),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: "Booking Date: ",
                ),
                TextSpan(
                    text: invoice.patientDetails.bookingDate.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
              SizedBox(height: 5),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: "Address: ",
                ),
                TextSpan(
                    text: invoice.patientDetails.address.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
              SizedBox(height: 5),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: "Report Generated Date & Time: ",
                ),
                TextSpan(
                    text: invoice.patientDetails.reportGeneratedDT.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: "Test Id:",
                ),
                TextSpan(
                    text: invoice.patientDetails.testId.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
              SizedBox(height: 5),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: "Contact No:",
                ),
                TextSpan(
                    text: invoice.patientDetails.contactno.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
              SizedBox(height: 5),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: "Time",
                ),
                TextSpan(
                    text: invoice.patientDetails.bookingTime.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
            ])
          ]),
      SizedBox(height: 10)
    ]);
  }

  static Widget buildTotal(Invoice invoice) {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Spacer(),
      Text("Total Amount: ",
          style: const TextStyle(
            fontSize: 15,
          )),
      SizedBox(height: 5),
      Text("${invoice.totalAmount}. pkr",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
    ]);
  }

  static Widget buildFooter() {
    return Container(
        padding: const EdgeInsets.all(8),
        color: PdfColors.grey300,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text("Address: ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text("Opp DHQ Hospital Link Road Abbottabad",
              style: const TextStyle(
                fontSize: 15,
              ))
        ]));
  }

  static Widget buildInvoice(Invoice invoice) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(color: PdfColors.grey300),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Test Names"),
          Text("Normal Range"),
          Text("Units"),
          Text("Results"),
        ]),
      ),
      ListView.builder(
          itemBuilder: (contxt, index) {
            var reportsdata =
                (jsonDecode(invoice.reports) as Map<dynamic, dynamic>);
            var key = reportsdata.keys;
            var keylist = [];
            for (var e in key) {
              keylist.add(e);
            }

            var data = reportsdata[keylist[index]].toString();
            var range = "Null";
            var unit = "Null";
            var reportresult = "Null";
            if (data.contains("rng")) {
              var splitdata = data.split("rng");
              // ['1213','rng235unit65']
              reportresult = splitdata[0];
              if (splitdata[1].contains('unit')) {
                range = splitdata[1].split("unit")[0].replaceAll("rng", "");
                // ['rng235','unit65']
                unit = splitdata[1].split("unit")[1].replaceAll("unit", "");
              } else {
                range = splitdata[1].replaceAll("rng", "");
              }
            } else {
              reportresult = data;
            }

            return Container(
              padding: const EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(keylist[index]),
                  ),
                  Text(range),
                  Text(unit),
                  Text(reportresult),
                ],
              ),
            );
          },
          itemCount: (jsonDecode(invoice.reports) as Map<dynamic, dynamic>)
              .keys
              .length)
    ]);
  }
}

class PdfApi {
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = await getApplicationCacheDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
