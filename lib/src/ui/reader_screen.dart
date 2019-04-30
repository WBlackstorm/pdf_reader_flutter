import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ReaderScreen extends StatefulWidget {

  @override
  ReaderScreenState createState() {
    return ReaderScreenState();
  }

}

class ReaderScreenState extends State<ReaderScreen> {

  String filePath = '';

  @override
  void initState() {
    super.initState();
    copyAsset().then((file){      
      setState(() {
        filePath = file.path;
        print(filePath);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Document"),
        ),
        path: filePath,
      );
  }

  Future<File> copyAsset() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File tempFile = File('$tempPath/copy.pdf');
    var bd = await rootBundle.load('lib/src/content/apostila.pdf');
    await tempFile.writeAsBytes(bd.buffer.asUint8List(), flush: true);
    return tempFile;
  }

}