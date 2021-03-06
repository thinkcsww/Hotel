import 'package:flutter/material.dart';
import 'home.dart';
import 'search.dart';
import 'favorite_hotel.dart';
import 'ranking.dart';
import 'mypage.dart';


class HotelApp extends StatelessWidget {

//  ThemeData _buildHotelTheme() {
//    final ThemeData base = ThemeData.light();
//    return base.copyWith(
//      primaryColor: Colors.blue,
//    );
//  }
//  final ThemeData kDefaultTheme = new ThemeData(
//    primarySwatch: Colors.orange,
//    accentColor: Colors.orangeAccent[400],
//    primaryColor: Colors.lime[50],
//  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel',
      home: HomePage(),
//      theme: kDefaultTheme,
      initialRoute: '/home',
      onGenerateRoute: _getRoute,
      routes: {
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/ranking': (context) => RankingPage(),
        '/favorite_hotel': (context) => FavoriteHotelPage(),
        '/my_page': (context) => MyPage(),
      },
    );
  }

  Route<dynamic> _getRoute(RouteSettings setting) {
    return MaterialPageRoute<void> (
      settings: setting,
      builder: (BuildContext context) => HomePage(),
      fullscreenDialog: true,
    );
  }
}
