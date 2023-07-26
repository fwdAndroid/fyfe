import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewer extends StatelessWidget {
  final String filePath;

  PDFViewer({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: true,
        pageFling: true,
        pageSnap: true,
        fitPolicy: FitPolicy.BOTH,
        preventLinkNavigation:
            false, // if set to true the link is handled in flutter

        filePath: filePath,
      ),
    );
  }
}
