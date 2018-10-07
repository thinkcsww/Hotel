import 'package:flutter/material.dart';
import 'model/hotel.dart';
import 'home.dart';
import 'dart:async';
import 'package:intl/intl.dart';



class LocationItem {
  bool isExpanded;
  final String title;
  final String explanation;
  LocationItem(this.isExpanded, this.title, this.explanation);
}
class RoomItem {
  bool isExpanded;
  final String title;
  final String explanation;
  RoomItem(this.isExpanded, this.title, this.explanation);
}
class RatingItem {
  bool isExpanded;
  final String title;
  final String explanation;
  RatingItem(this.isExpanded, this.title, this.explanation);
}
enum StayingLocation { Seoul, Busan, Daegu}
enum StayingRoom { Single, Double, Family}
StayingLocation _location = StayingLocation.Seoul;
StayingRoom _room = StayingRoom.Single;


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  DateTime _checkInDate = DateTime.now();
  TimeOfDay _checkInTime = TimeOfDay.now();
  DateTime _checkOutDate = DateTime.now();
  TimeOfDay _checkOutTime = TimeOfDay.now();

  List<Icon> buildStarsForReserve(Map<String, bool> checkboxValues) {
    List<Icon> stars = List<Icon>();

    if (checkboxValues["1"]) {
      stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
    }
    if (checkboxValues["2"]) {
      if(stars.isNotEmpty) {
        stars.add(Icon(Icons.battery_full,size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
      } else {
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
      }
    }
    if (checkboxValues["3"]) {
      if(stars.isNotEmpty) {
        stars.add(Icon(Icons.battery_full,size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
      } else {
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
      }
    }
    if (checkboxValues["4"]) {
      if(stars.isNotEmpty) {
        stars.add(Icon(Icons.battery_full,size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
      } else {
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
      }
    }
    if (checkboxValues["5"]) {
      if(stars.isNotEmpty) {
        stars.add(Icon(Icons.battery_full,size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
      } else {
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 15.0,));
      }
    }

    return stars;
  }

  Future<Null> _selectCheckInDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _checkInDate,
        firstDate: DateTime(2016),
        lastDate: DateTime(2019));
    if (picked != null && picked != _checkInDate) {
      setState(() {
        _checkInDate = picked;
      });
      print('Date selected: ${_checkInDate.toString()}');
    }
  }
  Future<Null> _selectCheckOutDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _checkOutDate,
        firstDate: DateTime(2016),
        lastDate: DateTime(2019));
    if (picked != null && picked != _checkOutDate) {
      setState(() {
        _checkOutDate = picked;
      });
      print('Date selected: ${_checkOutDate.toString()}');
    }
  }

  Future<Null> _selectCheckInTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _checkInTime);

      if(picked != null && picked != _checkInTime) {

        setState(() {
          _checkInTime = picked;
        });
        print('Time selected: ${_checkInTime.toString()}');
      }
  }
  Future<Null> _selectCheckOutTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: _checkOutTime);

    if(picked != null && picked != _checkOutTime) {

      setState(() {
        _checkOutTime = picked;
      });
      print('Time selected: ${_checkOutTime.toString()}');
    }
  }

  Future<Null> _showAlertDialog(BuildContext context) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(

          contentPadding: EdgeInsets.all(0.0),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  height: 50.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(

                            child: Text('Please check your choice :)',
                            style: TextStyle(color:Colors.white),
                              textAlign: TextAlign.center,
                            )
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on, color: Colors.blue.shade200,),
                              SizedBox(
                                width: 200.0,
                                child: Text(_location.toString().substring(16), textAlign: TextAlign.center, style: TextStyle(color: Colors.grey),)
                              ),

                            ],
                          ),
                          SizedBox(height: 20.0,),
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on, color: Colors.blue.shade200,),
                              SizedBox(
                                  width: 200.0,
                                  child: Text(_room.toString().substring(12), textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),)
                              ),

                            ],
                          ),
                          SizedBox(height: 20.0,),

                          Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.yellow,),
                              SizedBox(
                                  width: 200.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                      buildStarsForReserve(checkboxValues),
                                  ),
                              ),



                            ],
                          ),
                          SizedBox(height: 20.0,),
                          Row(

                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Icon(Icons.location_on, color: Colors.blue.shade200,),
                              ),
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: Text('IN',style: TextStyle(fontSize: 8.0),),
                                      ),
                                      SizedBox(
                                          width: 200.0,
                                          child: Text('${DateFormat('y.M.d(E)').format(_checkInDate)}, ${_checkInTime.hour}:${_checkInTime.minute} ${_checkInTime.period.toString().substring(10)}', textAlign: TextAlign.center,style: TextStyle(color: Colors.grey, fontSize: 10.0),)
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: Text('OUT',style: TextStyle(fontSize: 8.0),),
                                      ),
                                      SizedBox(
                                          width: 200.0,
                                          child: Text('${DateFormat('y.M.d(E)').format(_checkOutDate)} ${_checkOutTime.hour}:${_checkOutTime.minute} ${_checkOutTime.period.toString().substring(10)}', textAlign: TextAlign.center,style: TextStyle(color: Colors.grey, fontSize: 10.0),)
                                      ),
                                    ],
                                  )
                                ],
                              ),


                            ],
                          ),

                        ],
                      ),
                      Column(
                        children: <Widget>[

                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 100.0,
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text('Search', style: TextStyle(color: Colors.white),),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    SizedBox(
                      width: 100.0,
                      child: RaisedButton(
                        color: Colors.grey,
                        child: Text('Cancle', style: TextStyle(color: Colors.white),),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25.0,)
              ],
            ),
          ),
        );
      }
    );
  }
  Map<String, bool> checkboxValues = {
    '1' : false,
    '2' : false,
    '3' : false,
    '4' : false,
    '5' : false,
  };
  bool switchValue = false;
  double sliderValue = 0.0;
  List<LocationItem> locationItem = <LocationItem>[
    LocationItem(
        false,
        'Location',
        'select location',
    )
  ];
  List<RoomItem> roomItem = <RoomItem>[
    RoomItem(
      false,
      'Room',
      'select room',
    ),
  ];
  List<RatingItem> ratingItem = <RatingItem>[
    RatingItem(
      false,
      'Rating',
      'select a hotel rating',
    ),
  ];

  Row checkBoxRow (int num, String id) {
    return Row(
      children: <Widget>[
        SizedBox(width: 180.0,),
        Checkbox(
          onChanged: (bool value) {
            setState(() {
              checkboxValues[id] = value;
            });
          },
          value: checkboxValues[id],
        ),
        Row(
          children: HomePage().buildStars(num, 20.0),
        )
      ],
    );
  }

  ExpansionPanelList locationExpasionList () {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpaned) {
        setState(() {
          locationItem[index].isExpanded = !locationItem[index].isExpanded;
        });
      },
      children: locationItem.map((LocationItem locationItem) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                leading: Text('${locationItem.title}'),
                title: Text(
                  '${locationItem.explanation}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0),),
              );
            },
            isExpanded: locationItem.isExpanded,
            body: Padding(
              padding: const EdgeInsets.only(left: 120.0),
              child: Column(
                children: <Widget>[
                  RadioListTile(
                    onChanged: (StayingLocation value) {setState(() {
                      _location = value;
                    }); },
                    activeColor: Colors.blue,
                    value: StayingLocation.Seoul,
                    groupValue: _location,
                    title: Text('Seoul'),
                  ),
                  RadioListTile(
                    onChanged: (StayingLocation value) {setState(() {
                      _location = value;
                    }); },
                    activeColor: Colors.blue,
                    value: StayingLocation.Busan,
                    groupValue: _location,
                    title: Text('Busan'),
                  ),
                  RadioListTile(
                    onChanged: (StayingLocation value) {setState(() {
                      _location = value;
                    }); },
                    activeColor: Colors.blue,
                    value: StayingLocation.Daegu,
                    groupValue: _location,
                    title: Text('Daegu'),
                  ),
                ],
              ),
            )
        );
      }).toList(),
    );
  }
  ExpansionPanelList roomExpansionList () {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpaned) {
        setState(() {
          roomItem[index].isExpanded = !roomItem[index].isExpanded;
        });
      },
      children: roomItem.map((RoomItem roomItem) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                leading: Text('${roomItem.title}'),
                title: Text(
                  '${roomItem.explanation}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0),),
              );
            },
            isExpanded: roomItem.isExpanded,
            body: Padding(
              padding: const EdgeInsets.only(left: 120.0),
              child: Column(
                children: <Widget>[
                  RadioListTile(
                    onChanged: (StayingRoom value) {setState(() {
                      _room = value;
                    }); },
                    activeColor: Colors.blue,
                    value: StayingRoom.Single,
                    groupValue: _room,
                    title: Text('Single'),
                  ),
                  RadioListTile(
                    onChanged: (StayingRoom value) {setState(() {
                      _room = value;
                    }); },
                    activeColor: Colors.blue,
                    value: StayingRoom.Double,
                    groupValue: _room,
                    title: Text('Double'),
                  ),
                  RadioListTile(
                    onChanged: (StayingRoom value) {setState(() {
                      _room = value;
                    }); },
                    activeColor: Colors.blue,
                    value: StayingRoom.Family,
                    groupValue: _room,
                    title: Text('Family'),
                  ),
                ],
              ),
            )
        );
      }).toList(),
    );
  }
  ExpansionPanelList ratingExpasionList () {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpaned) {
        setState(() {
          ratingItem[index].isExpanded = !ratingItem[index].isExpanded;
        });
      },
      children: ratingItem.map((RatingItem ratingItem) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                leading: Text('${ratingItem.title}'),
                title: Text(
                  '${ratingItem.explanation}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0),),
              );
            },
            isExpanded: ratingItem.isExpanded,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  checkBoxRow(1, '1'),
                  checkBoxRow(2, '2'),
                  checkBoxRow(3, '3'),
                  checkBoxRow(4, '4'),
                  checkBoxRow(5, '5'),


                ],
              ),
            )
        );
      }).toList(),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body:
      ListView(
        children: <Widget>[
          locationExpasionList(),
          roomExpansionList(),
          ratingExpasionList(),

          Container(
            padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
            child: Row(

              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Date', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),

                    ],
                  ),
                ),
                Text('I don\'t have specific dates yet', style: TextStyle(fontSize: 10.0, color: Colors.grey),textAlign: TextAlign.right,),
                Switch(
                  onChanged: (bool value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                  value: switchValue,
                  activeColor: Colors.blue,
//                          onChanged: null
                )
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 54.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        Text('check-in', style: TextStyle(fontSize: 16.0),)
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Text('${DateFormat('y.M.d(E)').format(_checkInDate)}', style: TextStyle(fontSize: 10.0, color: Colors.grey),),
                    Text('${_checkInTime.hour}:${_checkInTime.minute} ${_checkInTime.period.toString().substring(10)}', style: TextStyle(fontSize: 10.0, color: Colors.grey) , textAlign: TextAlign.start,)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Column(
                    children: <Widget>[

                      SizedBox(
                        width: 150.0,
                        child: RaisedButton(
                          child: Text('select date'),
                          color: Colors.lightBlueAccent,
                            onPressed:
                            !switchValue?
                                () =>
                                _selectCheckInDate(context) : null
                        ),
                      ),
                      SizedBox(
                        width: 150.0,
                        child: RaisedButton(
                            child: Text('select time'),
                            color: Colors.lightBlueAccent,
                            onPressed:
                            !switchValue?
                                () =>
                                _selectCheckInTime(context) : null
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 54.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        Text('check-in', style: TextStyle(fontSize: 16.0),)
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Text('${DateFormat('y.M.d(E)').format(_checkOutDate)}', style: TextStyle(fontSize: 10.0, color: Colors.grey),),
                    Text('${_checkOutTime.hour}:${_checkOutTime.minute} ${_checkOutTime.period.toString().substring(10)}', style: TextStyle(fontSize: 10.0, color: Colors.grey) , textAlign: TextAlign.start,)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Column(
                    children: <Widget>[

                      SizedBox(
                        width: 150.0,
                        child: RaisedButton(
                            child: Text('select date'),
                            color: Colors.lightBlueAccent,
                            onPressed:
                            !switchValue?
                                () =>
                              _selectCheckOutDate(context) : null
                        ),
                      ),
                      SizedBox(
                        width: 150.0,
                        child: RaisedButton(
                            child: Text('select time'),
                            color: Colors.lightBlueAccent,
                            onPressed:
                              !switchValue?
                                  () =>
                                  _selectCheckOutTime(context) : null
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          Divider(color: Colors.grey,),
          Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Fee'),
                    ),
                    Text('Up to \$${sliderValue.round()}', textAlign: TextAlign.end,),
                  ],
                ),
                Slider(
                  activeColor: Colors.blue,
                  value: sliderValue,
                  onChanged: (double value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                  max: 300.0,
                  min: 0.0,
                ),
                SizedBox(height: 50.0,),
                SizedBox(
                  height: 50.0,
                  width: 250.0,
                  child: RaisedButton(
                    child: Text('Search', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    onPressed: (){
                      _showAlertDialog(context);

                    })
                  ,
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
