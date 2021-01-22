
import 'package:flutter/material.dart';

class MiBoton extends StatelessWidget {

  final Function onClick;
  final double heightButton;
  final String title;
  final Color colorButton;
  final double radiusBotton;
  final Color colorText;
  final double sizeText;

  MiBoton({
    @required this.onClick,
    this.heightButton = 50.0,
    this.title = 'Titulo',
    this.colorButton = Colors.blue,
    this.radiusBotton = 8.0,
    this.colorText = Colors.white,
    this.sizeText = 18.0
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onClick,
      child: Container(
        height: this.heightButton,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.5),
          color: this.colorButton,
          borderRadius: BorderRadius.circular(this.radiusBotton)
        ),
        child: Center(
          child: Text(this.title,
            style: TextStyle(
              color: this.colorText, 
              fontSize: this.sizeText, 
              fontWeight: FontWeight.bold
            )
          )
        ),
      ),
    );
  }
}
