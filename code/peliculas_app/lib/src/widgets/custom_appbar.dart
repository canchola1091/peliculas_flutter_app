
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          IconButton(
            icon: Icon(Icons.menu, size: 28.0, color: Colors.white), 
            onPressed: () {}
          ),

          Text('Movies', 
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),

          IconButton(
            icon: Icon(Icons.search, size: 28.0, color: Colors.white), 
            onPressed: () {}
          ),

        ],
      ),
    );
  }

}