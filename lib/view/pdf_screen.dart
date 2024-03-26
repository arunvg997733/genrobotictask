import 'dart:io';
import 'package:flutter/material.dart';
import 'package:genrobotictask/controller/pdf_controller.dart';
import 'package:genrobotictask/core/constant.dart';
import 'package:genrobotictask/widget/custom_button/custom_button.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

class PdfScreen extends StatelessWidget {
  PdfScreen({super.key});

  final getPdfCtr = Get.put(PdfController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              text: 'View',
              width: double.infinity,
              function: () async {
                File? pdfFile =
                    await getPdfCtr.generateAndDownloadPDF(context, "0");

                if (pdfFile != null) {
                  OpenFile.open(pdfFile.path);
                }
              },
            ),
            kHeight20,
            CustomButton(
              text: 'DownLoad',
              width: double.infinity,
              function: () async {
                await getPdfCtr.generateAndDownloadPDF(context, "1");
              },
            )
          ],
        ),
      ),
    );
  }
}
