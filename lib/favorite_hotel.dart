import 'package:flutter/material.dart';
import 'model/hotel.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:midterm_21300765/model/hotels_repository.dart';
import 'model/hotel.dart';

class FavoriteHotelPage extends StatefulWidget {
  @override
  _FavoriteHotelPageState createState() => _FavoriteHotelPageState();
}

class _FavoriteHotelPageState extends State<FavoriteHotelPage> {

  SharedPreferences prefs;

  List<Hotel> hotels = HotelsRepository.loadHotels();
  List<String> hotelNames = List<String>();


  void getFavorite() async {
    prefs = await SharedPreferences.getInstance();
    for (Hotel hotel in hotels) {
      String name = prefs.getString(hotel.name);
      if (name != null) {
        setState(() {
          hotelNames.add(name);
        });
      }
    }
    print(hotelNames);
  }
  void deleteFavorite(String name) async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove(name);
    print("deleted");
  }
  void setFavoriteStateFalse(String name) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('${name}Favorite', false);
  }

  @override void initState() {
    getFavorite();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite Hotels'),
        ),

        body: ListView.builder(
          itemCount: hotelNames.length,
          itemBuilder: (context, index) {
            final hotelName = hotelNames[index];
            return Dismissible(
              key: Key(hotelName),
              onDismissed: (direction) {
                setState(() {
                  hotelNames.removeAt(index);
                  deleteFavorite(hotelName);
                  setFavoriteStateFalse(hotelName);
                });
              },
              background: Container(color: Colors.red,),
              child: ListTile(title: Text(hotelName),),
            );
          }),

    );
  }
}

