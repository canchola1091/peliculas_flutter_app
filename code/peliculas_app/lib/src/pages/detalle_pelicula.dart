
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas_app/src/controllers/now_playing_controller.dart';
import 'package:peliculas_app/src/models/cast_model.dart';
import 'package:peliculas_app/src/models/peliculas_nowplaying_model.dart';
import 'package:peliculas_app/src/utils/utils.dart';
import 'package:peliculas_app/src/widgets/bakground.dart';
import 'package:peliculas_app/src/widgets/miboton.dart';

class DetallePelicula extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
          children: [
            BackGround(),
            _content(),
            _iconClose(),
          ],
        )
      );
  }

  Widget _content() {
    return GetBuilder<NowpPlayingaController>(
      id: 'body_cast',
      builder: (_) =>SingleChildScrollView(
        child: Column(
          children: [
            _header(_.modeloPeli, _.gIndex),
            _overview(_.modeloPeli, _.gIndex),
            _buttomBuy(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Cast', style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w500))
              ),
            ),
            (_.gIsLoadingCast) ? Center(child: CircularProgressIndicator()) : _listCast(_.gModelCast),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Screenshots', style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w500))
              ),
            ),
            // _listScreenShots(_.gModelScreen)
            _texttriste()
          ],
        ),
      ),
    );
  }

  Widget _header(PeliculasNowPlayingModel _myModel, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              child: Hero(
                tag: 'img-$index',
                child: Image.network(
                  "${Utils.urlImg}${_myModel.results[index].backdropPath}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0), 
              child: _nameAndRate(_myModel, index)
            ),
          ],
        )
      ],
    );
  }

  Widget _nameAndRate(PeliculasNowPlayingModel _myModel, int index) {
    final _styleNamePeli = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0);
    final _styleCategory = TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12.0);
    final _stylePorcent = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    final _styleName = TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 85.0),
        Text('${_myModel.results[index].originalTitle}', style: _styleNamePeli),
        SizedBox(height: 3.0),
        Text('Categoria y duración', style:  _styleCategory),
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [        
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${_myModel.results[index].voteCount}', style: _stylePorcent),
            Text('IMDB', style: _styleName),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${_myModel.results[index].voteAverage}%', style: _stylePorcent),
            Text('Rotten Tomato', style: _styleName),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${_myModel.results[index].voteAverage}%', style: _stylePorcent),
            Text('Metacritic', style: _styleName),
          ],
        ) 
      ],
    ).paddingSymmetric(vertical: 18.0) 
      ],
    ); 
  }

  Widget _overview(PeliculasNowPlayingModel _myModel, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Text('${_myModel.results[index].overview}%',
        style: TextStyle(color: Colors.white.withOpacity(0.7)),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buttomBuy() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 80.0),
      child: MiBoton(
        colorButton: Colors.transparent,
        title: 'Buy Tickets',
        heightButton: 43.0,
        radiusBotton: 100.0,
        onClick: () {}
      ),
    );
  } 

  Widget _listCast(CastModel _myModelCast) {
    return Container(
      height: Utils.porcientoH(Get.context, 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            height: Utils.porcientoH(Get.context, 20),
            width: 110.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network('${Utils.urlImg}${_myModelCast.cast[i].profilePath}', 
                    fit: BoxFit.cover
                  ),
                ),
                Container(
                  height: Utils.porcientoH(Get.context, 20),
                  width: 190.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  child: Text(
                    _myModelCast.cast[i].name, style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  )
                )
              ],
            ),
          );
        }
      ),
    );
  }

  // Widget _listScreenShots(ScreenShootsModel screenModel) {
  //   return Container(
  //     height: Utils.porcientoH(Get.context, 20),
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: 10,
  //       itemBuilder: (BuildContext context, int i) {
  //         return Container(
  //     height: Utils.porcientoH(Get.context, 20),
  //     child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(20.0),
  //                 child: Image.network('${Utils.urlImg}${Utils.urlImg}${screenModel.backdrops[i].filePath}', 
  //                   fit: BoxFit.cover
  //                 ),
  //     ),
  //   );
  //       }
  //     ),
  //   );
  // }

  Widget _texttriste() {
    return Center(
      child: Text('No me dio tiempo de consumir los screenshoots =(', style: TextStyle(color:Colors.white),),
    );
  }

  Widget _iconClose() {
    return Positioned(
      top: 20.0,
      right: 20.0,
      child: IconButton(
        icon: Icon(Icons.dangerous, color: Colors.white, size: 35.0), 
        onPressed: () => Get.back()
      )
    );
  }

}