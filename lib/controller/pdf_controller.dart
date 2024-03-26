import 'dart:io';
import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genrobotictask/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class PdfController extends GetxController {
  Future<File?> generateAndDownloadPDF(
      BuildContext context, String option) async {
    final pdf = pw.Document();
    PermissionStatus status = await Permission.storage.status;
    if (status != PermissionStatus.granted) {
      status = await Permission.storage.request();
    }
    if (status.isGranted) {
      final img = await rootBundle.load('assets/logo.jpg');
      final imageBytes = img.buffer.asUint8List();
      try {
        Directory? downloadsDir = await getDownloadsDirectory();

        pdf.addPage(
          pw.Page(build: (context) {
            return pw.Container(
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 10),
                  pw.Row(
                    children: [
                      pw.SizedBox(width: 10),
                      pw.Container(
                          width: 40,
                          height: 40,
                          child: pw.Image(pw.MemoryImage(imageBytes))),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text('WEEKLY WORK REPORT',
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 12)),
                        ),
                      )
                    ],
                  ),
                  pw.SizedBox(height: 10),
                  pdfDivider(),
                  pw.Container(
                    height: 30,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '  Project Name',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            'Robotic Manhole Cleaningat KWA TVM',
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            'Purchase Order Number',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('KWA TVM',
                              style: const pw.TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.Container(
                    height: 30,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '  Contractor',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            'Genrobotic Innovations Pvt. Ltd',
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            'Muncipality',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('KWA TVM',
                              style: const pw.TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '  Date',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '27/11/2023 - 1/12/2023',
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            'Zone',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('100',
                              style: const pw.TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.SizedBox(height: 5),
                  pw.Text(
                    'Vehicle Details',
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 12),
                  ),
                  pw.Divider(
                    height: 0,
                  ),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '  Reg Number',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 8),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Text(
                            'Asset Number',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 8),
                          ),
                        ),
                        pw.SizedBox(
                          width: 15,
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('Vehicle Model',
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold, fontSize: 8)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '  kl16n5852',
                            style: const pw.TextStyle(fontSize: 8),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Text(
                            '1234',
                            style: const pw.TextStyle(fontSize: 8),
                          ),
                        ),
                        pw.SizedBox(
                          width: 15,
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('truck',
                              style: const pw.TextStyle(fontSize: 8)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.SizedBox(height: 5),
                  pw.Text(
                    'Fuel Cost',
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 12),
                  ),
                  pdfDivider(),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '  Total KM',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('6',
                              style: const pw.TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '  Total Fuel filled',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('5',
                              style: const pw.TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '  Amount Paid',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('500',
                              style: const pw.TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.SizedBox(height: 5),
                  pw.Text(
                    'Weekly Fuel Details',
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 12),
                  ),
                  pdfDivider(),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Row(
                            children: [
                              pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  '  Sl.no',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 8),
                                ),
                              ),
                              pw.VerticalDivider(),
                              pw.Expanded(
                                flex: 2,
                                child: pw.Text(
                                  'Date',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 8),
                                ),
                              )
                            ],
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.Text(
                                  'Vehicle KM',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 8),
                                ),
                              ),
                              pw.VerticalDivider(),
                              pw.Expanded(
                                child: pw.Text(
                                  'Fuel Filled',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 8),
                                ),
                              )
                            ],
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            'Amount Paid',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 8),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('Operator',
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold, fontSize: 8)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Row(
                            children: [
                              pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  '  1',
                                  style: const pw.TextStyle(fontSize: 8),
                                ),
                              ),
                              pw.VerticalDivider(),
                              pw.Expanded(
                                flex: 2,
                                child: pw.Text(
                                  '1-12-2023',
                                  style: const pw.TextStyle(fontSize: 8),
                                ),
                              )
                            ],
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.Text(
                                  '300',
                                  style: const pw.TextStyle(fontSize: 8),
                                ),
                              ),
                              pw.VerticalDivider(),
                              pw.Expanded(
                                child: pw.Text(
                                  '5',
                                  style: const pw.TextStyle(fontSize: 8),
                                ),
                              )
                            ],
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '500',
                            style: const pw.TextStyle(fontSize: 8),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('Operator',
                              style: const pw.TextStyle(fontSize: 8)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.SizedBox(height: 5),
                  pw.Text(
                    'Weekly Vehicle Running Details',
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 12),
                  ),
                  pw.Divider(
                    height: 0,
                  ),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Row(
                            children: [
                              pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  '  Sl.no',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 8),
                                ),
                              ),
                              pw.VerticalDivider(),
                              pw.Expanded(
                                flex: 2,
                                child: pw.Text(
                                  'Date',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 8),
                                ),
                              )
                            ],
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Row(
                            children: [
                              pw.Text(
                                'Kilometre',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                        pw.SizedBox(
                          width: 16,
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('Fuel Used',
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold, fontSize: 8)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Row(
                            children: [
                              pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  '  1',
                                  style: const pw.TextStyle(fontSize: 8),
                                ),
                              ),
                              pw.VerticalDivider(),
                              pw.Expanded(
                                flex: 2,
                                child: pw.Text(
                                  '2023-12-1',
                                  style: const pw.TextStyle(fontSize: 8),
                                ),
                              )
                            ],
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Row(
                            children: [
                              pw.Text(
                                '6',
                                style: const pw.TextStyle(fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                        pw.SizedBox(
                          width: 16,
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('1',
                              style: const pw.TextStyle(fontSize: 8)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.SizedBox(height: 20),
                  pdfDivider(),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '  For Genrobotics Invocation Pvt Ltd',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('For KWA TVM',
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '  Supervisor',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '',
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            'Controlling Officer',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('admin',
                              style: const pw.TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '  Signature',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '',
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            'Signature',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('',
                              style: const pw.TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider(),
                  pw.Container(
                    height: 20,
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '  Seal',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            '',
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            'Seal',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        pw.VerticalDivider(),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text('',
                              style: const pw.TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                  ),
                  pdfDivider()
                ],
              ),
            );
          }),
        );

        final pdfFile = File('${downloadsDir!.path}/Report.pdf');

        await pdfFile.writeAsBytes(await pdf.save());

        if (option == "1") {
          final name = DateTime.now().toString();
          showToast(msg: "Start downloading...");
          final pdfSaved = await pdf.save();
          await pdfFile.writeAsBytes(pdfSaved.toList());

          DocumentFileSavePlus().saveMultipleFiles(
            dataList: [
              pdfSaved,
            ],
            fileNameList: [
              "Report - $name.pdf",
            ],
            mimeTypeList: [
              "example/pdf",
            ],
          );
          showToast(msg: "Download completed");
        }

        return pdfFile;
      } catch (error) {
        print('Error generating PDF: $error');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to generate PDF: $error'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        return null;
      }
    }
  }
}

pw.Widget pdfDivider() {
  return pw.Divider(
    height: 0,
  );
}
