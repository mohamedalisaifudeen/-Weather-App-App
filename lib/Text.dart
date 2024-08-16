import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  late EdgeInsets edge;
  late String txt;
  late TextAlign align;
  late double size;

  Txt({required EdgeInsets this.edge,required String this.txt,required TextAlign this.align,required double this.size});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edge,
      child: Text(
        txt,
        textAlign:align,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: size,
        ),
      ),
    );

  }
}
