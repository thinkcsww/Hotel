import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'search.dart';



class HomePage extends StatelessWidget {

  Color iconColor = Colors.blue.shade200;

  ListTile makeDrawerListTile(String name, Icon icon, BuildContext context, String pageName) {
    return ListTile(
      title: Text(name, style: TextStyle(color: Colors.grey),),
      leading: icon,
      onTap: () {
        Navigator.pushNamed(context, pageName);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'tune',
            ),
            onPressed: () {

            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.fromLTRB(20.0, 120.0, 0.0, 0.0),
              child: Text('Pages', style: TextStyle(color: Colors.white, fontSize: 22.0),),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            makeDrawerListTile('Home', Icon(Icons.home, color: iconColor,), context, '/home'),
            makeDrawerListTile('Search', Icon(Icons.search, color: iconColor,), context, '/search'),
            makeDrawerListTile('Favorite Hotel', Icon(Icons.location_city, color: iconColor,), context, '/favorite_hotel'),
            makeDrawerListTile('Ranking', Icon(Icons.insert_chart, color: iconColor,), context, '/ranking'),
            makeDrawerListTile('My Page', Icon(Icons.person, color: iconColor,), context, '/my_page'),

          ],
        ),
      ),
    );
  }
}
