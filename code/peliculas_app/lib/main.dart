import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:peliculas_app/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Péliculas App',
      home: Homepge()
    );
  }
}