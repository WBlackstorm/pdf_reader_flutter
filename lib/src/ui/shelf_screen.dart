import 'package:flutter/material.dart';
import 'reader_screen.dart';

class ShelfScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shelf'),
      ),
      body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(10, (index) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReaderScreen()),
                  );
                },
                child: Image.asset(
                  'lib/src/images/revista.jpg',
                  width: 100.0,
                  height: 120.0,
                ),
              ),
            );
          }),
      ),
    );
  }
}