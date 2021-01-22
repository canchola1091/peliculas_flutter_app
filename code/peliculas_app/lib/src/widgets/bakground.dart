

import 'package:flutter/material.dart';
import 'package:peliculas_app/src/utils/utils.dart';


class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: <double> [
            0.1,
            0.6
          ],
          colors: <Color> [
            Utils.azulClaro,
            Utils.azulFuerte,
          ]
        )
      ),
    );
  }
}