
//IMPORTACIONES
import 'package:flutter/material.dart';

//MIS IMPORTACIONES

//GETX

class Utils {

  static const String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMzUwZGYxYTlkZjdjMGMxYjI1ODQ5ZjM2NjU4ZGYxNCIsInN1YiI6IjYwMDg0ZDI2MzUyMGU4MDA0YjYzNDVhNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6m2eKvivVBX36Tw6w5NXH_VCqKOoBylwaidMxroB_aQ'; 
  static  const String keyApi = '0350df1a9df7c0c1b25849f36658df14';
  static final String urlImg = 'https://image.tmdb.org/t/p/original';

  static double porcientoW(BuildContext context, int valor) {
    final size = MediaQuery.of(context).size;
    return ((size.width / 100) * valor);
  }

  static double porcientoH(BuildContext context, int valor) {
    final size = MediaQuery.of(context).size;
    return ((size.height / 100) * valor);
  }

  static bool validarEmail(String email) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return (regExp.hasMatch(email)) ? true : false;
  }

  /// Función para dar un espaciado vertical (height)
  static Widget separacionH(BuildContext context, int valor) {
    return SizedBox(height: porcientoH(context, valor));
  }

  /// Función para dar un espaciado vertical (width)
  static Widget separacionW(BuildContext context, int valor) {
    return SizedBox(width: porcientoW(context, valor));
  }

  //FUNCION COLOR DE HEXADECIMAL
  static Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}


//platea de colores de la aplicación:
  static get azulFuerte => Color.fromRGBO(67, 81, 155, 1.0);
  static get azulClaro => Color.fromRGBO(110, 154, 208, 1.0);


  static Map<String, String> getHeaderwithUserToken() {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Authorization": "Bearer " + accessToken
    };
    return requestHeaders;
  }
}
