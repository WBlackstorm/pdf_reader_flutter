import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class ReaderScreen extends StatelessWidget {

  String pdfPath = "";

  ReaderScreen(this.pdfPath);

  @override
  Widget build(BuildContext context) {
    print('Build');
    print(pdfPath);
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Document"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: pdfPath);
  }
}