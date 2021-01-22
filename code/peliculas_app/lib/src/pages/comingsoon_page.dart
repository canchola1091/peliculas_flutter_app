
import 'package:flutter/material.dart';
import 'package:peliculas_app/src/widgets/bakground.dart';

class ComingSoonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGround(),
          Center(
            child: Text('Coming Soon Page')
          ),
        ],
      ) 
    );
  }
}