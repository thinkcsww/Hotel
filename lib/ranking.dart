/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var data = [
      new ClicksPerYear('2016', 5, Colors.red),
      new ClicksPerYear('2017', 2, Colors.yellow),
      new ClicksPerYear('2018', 3, Colors.green),
    ];
    var series = [
      new charts.Series(
        domainFn: (ClicksPerYear rankData, _) => rankData.year,
        measureFn: (ClicksPerYear rankData, _) => rankData.rank,
        colorFn: (ClicksPerYear rankData, _) => rankData.color,
        id: 'Ranks',
        data: data,
      ),
    ];
    var chart = new charts.BarChart(
      series,
      animate: true,
    );
    var chartWidget = new Padding(
      padding: new EdgeInsets.all(32.0),
      child: new SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return new Scaffold(
      appBar: AppBar(
        title: Text('World Rank'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            chartWidget,
          ],
        ),
      ),
    );
  }
}

class ClicksPerYear {
  final String year;
  final int rank;
  final charts.Color color;

  ClicksPerYear(this.year, this.rank, Color color)
      : this.color = new charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
