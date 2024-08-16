import 'package:flutter/material.dart';


class AppIcon extends StatelessWidget {
  late EdgeInsets edge;
  late double size;
  late double weight;
  late IconData icon;

  AppIcon({required EdgeInsets this.edge,required double this.size, required double this.weight,required IconData this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:edge ,
      child: Icon(
        icon,
        color: Colors.white,
        size: size,
        weight: weight,

      ),
    );
  }
}