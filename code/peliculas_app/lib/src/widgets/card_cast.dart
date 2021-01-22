
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas_app/src/utils/utils.dart';

class Cardcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.porcientoH(Get.context, 20),
      child: Stack(
        children: [
          Positioned(
            bottom: 15.0,
            child: Text('nombre del actor')
          )
        ],
      ),
    );
  }
}