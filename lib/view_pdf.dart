import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'doc.dart';

class ViewPdf extends StatefulWidget {
  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
          build: generateDocument,
          initialPageFormat: PdfPageFormat.a4,
          onPrinted: hello()),
    );
  }
}

hello() {
  print('asd');
}
