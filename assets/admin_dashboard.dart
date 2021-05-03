import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AdminDashboard extends StatelessWidget {
  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Admin Dashboard',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: AdminPage(title: 'Admin Dashboard'),
  //   );
  // }
  Widget build(BuildContext context) {
    return new Scaffold(
        // appBar: new AppBar(
        //   // title: new Text("Leads"),
        // ),
        body: new AdminPage(title: 'Admin Dashboard'),
    );
  }
}

class AdminPage extends StatefulWidget {
  final String title;
  AdminPage({Key key = const Key("any_key"),this.title = ""}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _AdminDashboardState extends State<AdminPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('FB', 12, Colors.red),
      ClicksPerYear('IG', 42, Colors.yellow),
      ClicksPerYear('SEM', _counter, Colors.green),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(14.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Impression by Source:'),
            // Text('$_counter', style: Theme.of(context).textTheme.display1),
            chartWidget,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}