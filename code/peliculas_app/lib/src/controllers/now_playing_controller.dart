

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:peliculas_app/src/models/cast_model.dart';
import 'package:peliculas_app/src/models/peliculas_nowplaying_model.dart';
import 'package:peliculas_app/src/models/screenshots_model.dart';
import 'package:peliculas_app/src/providers/peliculas_provider.dart';

class NowpPlayingaController extends GetxController {

  PeliculasProvider _peliculasProvider = PeliculasProvider();

  @override
  void onInit() {
    super.onInit();
    _getPelisData();
  }

  bool _isLoading = true;
  bool get gIsLoading => _isLoading;

  PeliculasNowPlayingModel _peliculasNowPlayingModel;
  PeliculasNowPlayingModel get modeloPeli => _peliculasNowPlayingModel;


  bool _isLoadingCast = true;
  bool get gIsLoadingCast => _isLoadingCast;

  CastModel _castModel;
  CastModel get gModelCast => _castModel;


  bool _isLoadingScreen = true;
  bool get gIsLoadingScreen => _isLoadingScreen;

  ScreenShootsModel _screenModel;
  ScreenShootsModel get gModelScreen => _screenModel;

  int _index = 0;
  int get gIndex => _index;
  void sIndex(valor) {
    _index = valor;
    update(['body_peli', 'name_peli']);
  }


  void _getPelisData() async {
    _peliculasNowPlayingModel = await _peliculasProvider.getPeliculasNowPlaying();
    _isLoading = false;
    update(['body_peli']);
  }

  void getCast() async {
    _castModel = await _peliculasProvider.getCast(_peliculasNowPlayingModel.results[_index].id.toString());
    _isLoadingCast = false;
    update(['body_cast']);
  }

  // void getScreenShootsPelis() async {
  //   _screenModel = await _peliculasProvider.getScreenShoots(_peliculasNowPlayingModel.results[_index].id.toString());
  //   _isLoadingScreen = false;
  //   // update(['body_screen']);
  // }


}