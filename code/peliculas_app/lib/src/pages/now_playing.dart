
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:peliculas_app/src/controllers/now_playing_controller.dart';
import 'package:peliculas_app/src/models/peliculas_nowplaying_model.dart';
import 'package:peliculas_app/src/pages/detalle_pelicula.dart';
import 'package:peliculas_app/src/utils/utils.dart';
import 'package:peliculas_app/src/widgets/bakground.dart';
import 'package:peliculas_app/src/widgets/card_image_peli.dart';
import 'package:peliculas_app/src/widgets/miboton.dart';

class NowPlaying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NowpPlayingaController>(
      init: NowpPlayingaController(),
      id: 'body_peli',
      builder: (_) {
        return Scaffold(
          body: Stack(
            children: [
              BackGround(),
              (_.gIsLoading) 
              ? Center(child: CircularProgressIndicator())
              : _content()
            ],
          )
        );
      }
    );
  }

  Widget _content() {
    return GetBuilder<NowpPlayingaController>(
      builder: (_) => Column(
        children: [
          _listCards(_.modeloPeli),
          _namePeliCategoiry(_.modeloPeli, _.gIndex),
          _ratePeli(_.modeloPeli, _.gIndex),
          _buttomBuy() 
        ],
      ),
    );
  }

  Widget _listCards(PeliculasNowPlayingModel _myModel) {
    return GetBuilder<NowpPlayingaController>(
      builder: (_) => Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: Utils.porcientoH(Get.context, 40),
        child: Swiper(
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.8,
          scale: 0.9,
          onIndexChanged: (value) {
            _.sIndex(value);
          },
          itemCount: _myModel.results.length,
          itemBuilder: (BuildContext context,int index){
            return CardImagePeli(
              onClick: () {
                _.getCast();
                // _.getScreenShootsPelis();
                Get.to(
                  DetallePelicula(),
                  fullscreenDialog: true
                );
              },
              childImg: FittedBox(
                fit: BoxFit.cover,
                child: Hero(
                  tag: 'img-$index',
                  child: Image.network(
                    "${Utils.urlImg}${_myModel.results[index].backdropPath}",
                    fit: BoxFit.fill
                  ),
                )
              )
            );
          },
        ),
      ),
    );
  }

  Widget _namePeliCategoiry(PeliculasNowPlayingModel _myModel, int _index) {

    final _styleNamePeli = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0);
    final _styleCategory = TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12.0);

    return GetBuilder<NowpPlayingaController>(
      id: 'name_peli',
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${_myModel.results[_index].originalTitle}', style: _styleNamePeli),
          SizedBox(height: 3.0),
          Text('Categoria y duración', style:  _styleCategory),
        ],
      ),
    ); 
  }

  Widget _ratePeli(PeliculasNowPlayingModel _myModel, int _index) {

    final _stylePorcent = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    final _styleName = TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12.0);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [        
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${_myModel.results[_index].voteCount}', style: _stylePorcent),
            Text('IMDB', style: _styleName),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${_myModel.results[_index].voteAverage}%', style: _stylePorcent),
            Text('Rotten Tomato', style: _styleName),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${_myModel.results[_index].voteAverage}%', style: _stylePorcent),
            Text('Metacritic', style: _styleName),
          ],
        ) 
      ],
    ).paddingSymmetric(vertical: 18.0); 
  }

  Widget _buttomBuy() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 80.0),
          child: MiBoton(
            colorButton: Colors.transparent,
            title: 'Buy Tickets',
            heightButton: 45.0,
            radiusBotton: 100.0,
            onClick: () {}
          ),
        ),
        SizedBox(height: 10.0),
        Icon(Icons.arrow_circle_down, color: Colors.white)
      ],
    ).paddingOnly(top: 25.0);
  } 


}