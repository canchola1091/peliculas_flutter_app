
import 'package:flutter/material.dart';
import 'package:peliculas_app/src/pages/cinema_page.dart';
import 'package:peliculas_app/src/pages/comingsoon_page.dart';
import 'package:peliculas_app/src/pages/now_playing.dart';
import 'package:peliculas_app/src/utils/utils.dart';

class Homepge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _defController(),
    );
  }

  Widget _defController() {
    List<Tab> _tabHeaders = [
      Tab( text : 'Now Playing' ),
      Tab( text : 'Cinema' ),
      Tab( text : 'Coming Soon' ),
    ];

    List<Widget> _tabPages = [
      NowPlaying(),
      CinemaPage(),
      ComingSoonPage(),
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: _tabHeaders.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Utils.azulClaro,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.search),
            ),
          ],
          title: Text('Movies'),
          bottom: _tabBar(_tabHeaders),
      ),
        body: _tabBarView(_tabPages),
      )
    );
  }
  
  Widget _tabBar(List _tabHeaders) {
    List<Tab> _tabHeaders = [
      Tab( text : 'Now Playing' ),
      Tab( text : 'Cinema' ),
      Tab( text : 'Comming Soon' ),
    ];
    return TabBar(
      indicatorColor: Colors.white,
      tabs: _tabHeaders,
    );
  }

  Widget _tabBarView(List _tabPages) {  
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: _tabPages,
    );
  }
 

}