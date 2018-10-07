import 'package:flutter/material.dart';
import 'model/hotel.dart';
import 'model/hotels_repository.dart';
import 'detail.dart';



class HomePage extends StatelessWidget {
  Color iconColor = Colors.blue.shade200;


  List<Icon> buildStars(int num, double size) {

    List<Icon> stars = List<Icon>();
    for (int i = 0; i < num; i++) {
      stars.add(Icon(Icons.star, color: Colors.yellow, size: size));
    }
    return stars;


  }


  List<Card> _buildGridCards(BuildContext context) {
    List<Hotel> hotels = HotelsRepository.loadHotels();

    if (hotels == null || hotels.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);

    return hotels.map((hotel) {
      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              AspectRatio(
                aspectRatio: 18 / 11,
                child: Container(
                  width: 100.0,
                  child: Hero(
                      tag: hotel.imageAddress,
                      child: Image.network(hotel.imageAddress, fit: BoxFit.fill,)
                  ),
                ),
              ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 40.0, 0.0, 0.0),
                  child: Icon(Icons.location_on,color: iconColor, size: 15.0,),
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: buildStars(hotel.star, 10.0),
                          ),
                        ),
                        Text(
                          hotel.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight:FontWeight.bold, fontSize: 10.0),
                          maxLines: 1,
                        ),
                        SizedBox(height: 8.0,),
                        SizedBox(
                          height: 20.0,
                          child: Text(
                            hotel.address,
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey.shade500, fontSize: 9.0),
                          ),)
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(hotel: hotel,),
                        ),
                    );
                  },
                  child: Text('more', style: TextStyle(color: Colors.blue,))
                ),
              ],
            ),
          ],
        ),
      );
    }).toList();
  }

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
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'tune',
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/language');
            },
          )
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 10.0 / 12.4,
            children: _buildGridCards(context),
          );
        },
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

