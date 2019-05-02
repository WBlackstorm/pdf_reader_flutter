import 'package:flutter/material.dart';
import 'reader_screen.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ShelfScreen extends StatefulWidget {

  ShelfScreenState createState() => new ShelfScreenState();

}

class ShelfScreenState extends State<ShelfScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shelf'),
      ),
      body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(9, (index) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  copyAsset().then((file){      
                    setState(() {
                      print('Navigation');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReaderScreen(file.path)),
                      );
                    });
                  });
                },
                child: generateImage(index),
              ),
            );
          }),
      ),
    );
  }

  Image generateImage(int index) {

    String path = '';
    print(index);
    switch(index) {
      case 0:
        path = 'lib/src/images/capa1.png';
        break;
      case 1:
        path = 'lib/src/images/capa2.png';
        break;
      case 2:
        path = 'lib/src/images/capa3.png';
        break;
      case 3:
        path = 'lib/src/images/capa1.png';
        break;
      case 4:
        path = 'lib/src/images/capa2.png';
        break;
      case 5:
        path = 'lib/src/images/capa3.png';
        break;
      case 6:
        path = 'lib/src/images/capa1.png';
        break;
      case 7:
        path = 'lib/src/images/capa2.png';
        break;
      case 8:
        path = 'lib/src/images/capa3.png';
        break;   
      default:
        path = 'lib/src/images/revista.jpg';
        break;  
    }

    return Image.asset(
        path,
        width: 100.0,
        height: 120.0,
     );

  }

  Future<File> copyAsset() async {
    print('copyAsset');
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File tempFile = File('$tempPath/copy.pdf');
    var bd = await rootBundle.load('lib/src/content/apostila.pdf');
    await tempFile.writeAsBytes(bd.buffer.asUint8List(), flush: true);
    print(tempFile.path);
    return tempFile;
  }

}