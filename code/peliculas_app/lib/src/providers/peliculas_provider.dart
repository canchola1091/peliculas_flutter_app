
import 'package:http/http.dart'as http;
import 'package:peliculas_app/src/models/cast_model.dart';
import 'package:peliculas_app/src/models/peliculas_nowplaying_model.dart';
import 'package:peliculas_app/src/utils/utils.dart';

class PeliculasProvider {

  final String _urlHost = 'api.themoviedb.org';
  
  Future getPeliculasNowPlaying() async {
    final _url = Uri.https(_urlHost, '3/movie/now_playing');
    try {
      final _resp = await http.get(
        _url,
        headers: Utils.getHeaderwithUserToken()
      );
      final String _decodedData = _resp.body;
      final peliculas = peliculasNowPlayingModelFromJson(_decodedData);
      return peliculas;
    } catch (e) {
      print(e);
      return [];
    }
  }


  Future getPeliculasPopular() async {
    final _url = Uri.https(_urlHost, 'movie/popular');
    try {
      final _resp = await http.get(
        _url,
        headers: Utils.getHeaderwithUserToken()
      );
      final String _decodedData = _resp.body;
      final peliculas = peliculasNowPlayingModelFromJson(_decodedData);
      return peliculas;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future getCast(String idPeli) async {
    final _url = Uri.https(_urlHost, '3/movie/$idPeli/credits');
    try {
      final _resp = await http.get(
        _url,
        headers: Utils.getHeaderwithUserToken()
      );
      final String _decodedData = _resp.body;
      final peliculas = castModelFromJson(_decodedData);
      return peliculas;
    } catch (e) {
      print(e);
      return [];
    }
  }

  // Future getScreenShoots(String idPeli) async {
  //   final _url = Uri.https(_urlHost, '3/movie/$idPeli/images');
  //   try {
  //     final _resp = await http.get(
  //       _url,
  //       headers: Utils.getHeaderwithUserToken()
  //     );
  //     final String _decodedData = _resp.body;
  //     final peliculas = screenShootsModelFromJson(_decodedData);
  //     return peliculas;
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

}
