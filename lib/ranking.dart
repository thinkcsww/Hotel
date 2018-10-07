/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class RankingPage extends StatelessWidget {

  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking'),
      ),
      body: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 200.0,),
                Text('10000\$'),
                SizedBox(height: 10.0,),
                Text('7000\$'),
                SizedBox(height: 10.0,),
                Text('5000\$'),
                SizedBox(height: 10.0,),
                Text('3000\$'),
                SizedBox(height: 10.0,),
                Text('1000\$'),
              ],
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 200.0,),
                Center(
                  child: Container(
                    width: 300.0,
                    height: 150.0,
                    child: Sparkline(
                      data: data,
                      fillMode: FillMode.below,
                      fillColor: Colors.red[200]
                    )
                  ),
                ),
                SizedBox(height: 20.0,),
                Text('Burj Al Arab, Dubai\'s profit ')

              ],
            ),
          ),
        ],
      ),
    );
  }
}
