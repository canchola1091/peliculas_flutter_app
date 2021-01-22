
import 'package:flutter/material.dart';

class CardImagePeli extends StatelessWidget {

  final Widget childImg;
  final Function onClick;

  const CardImagePeli({
    @required this.childImg,
    @required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onClick,
      child: Container(
        clipBehavior: Clip.antiAlias,
        // width: Utils.porcientoW(context, 70),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow> [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 9.0)
            )
          ]
        ),
        child: this.childImg
      ),
    );
  }
}