import 'package:flutter/material.dart';
import 'model/hotel.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';


class DetailPage extends StatefulWidget {
  final Hotel hotel;
  final Color textColor = Colors.blue.shade500;

  DetailPage({Key key, @required this.hotel}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState(hotel: hotel);
}

class _DetailPageState extends State<DetailPage> {
   SharedPreferences prefs;

  final Hotel hotel;
  final Color textColor = Colors.blue.shade500;
  _DetailPageState({Key key, @required this.hotel});

  bool _isFavorited = false;
  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
      setFavoriteState();
      if (_isFavorited) {
        saveFavorite();
      } else {
        deleteFavorite();
      }
    });
  }
  void saveFavorite() async{
    prefs = await SharedPreferences.getInstance();
    prefs.setString(hotel.name, hotel.name);
    print(prefs.getString(hotel.name));
  }
  void deleteFavorite() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove(hotel.name);
    print("deleted");
  }
   void setFavoriteState() async {
     prefs = await SharedPreferences.getInstance();
     prefs.setBool('${hotel.name}Favorite', _isFavorited);
   }
  void getFavoriteState() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getBool('${hotel.name}Favorite') != null ){
        _isFavorited = prefs.getBool('${hotel.name}Favorite');
      } else {
        _isFavorited = false;
      }
    });
  }

  @override
  void initState() {
    getFavoriteState();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(hotel.name),
        ),
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width,
                    child: Hero(
                        tag: hotel.imageAddress,
                        child: Image.network(hotel.imageAddress, fit: BoxFit.fill,))
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                    child: IconButton(
                    icon: _isFavorited ?
                    Icon(Icons.favorite) : Icon(Icons.favorite_border),
                    color: Colors.red,
                    onPressed: _toggleFavorite),

                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Row(
                      children: HomePage().buildStars(hotel.star, 25.0),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      hotel.name, style: TextStyle(fontSize: 16.0,color: Colors.blue.shade800, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on, color: Colors.blue.shade200,),
                        Container(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(hotel.address, style: TextStyle(fontSize: 10.0, color: textColor),),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.phone, color: Colors.blue.shade200,),
                        Container(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(hotel.phoneNumber, style: TextStyle(fontSize: 16.0, color: textColor),),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey,),
                    Text(
                      hotel.explain,
                      style: TextStyle(color: textColor,),

                    )

                  ],

                ),
              ),
            )


          ],
        )
    );
  }
}
