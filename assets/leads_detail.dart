import 'package:flutter/material.dart';

class LeadsDetail extends StatefulWidget {
  @override
  _LeadsDetail createState() => _LeadsDetail();
}

class _LeadsDetail extends State<LeadsDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String lead_id;
  @override
  void initState() {
    // fetchLeads;
    super.initState();
  }

  Widget build(BuildContext context) {

    Color color = Theme
        .of(context)
        .primaryColor;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        // body: Center(
        //   child: Text('Hello World'),
          body: Column(
            children: [
              viewName,
              viewPhone,
              viewEmail,
              buttonSection,
            ],
          ),
        ),
      );
  }
}

    Widget viewName = Container(
      padding: const EdgeInsets.only(top: 10, bottom: 8, left: 20),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                  'Dummy Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                          ),
                        ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 1),
                  child:
                  Text(
                    'Date',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child:
                  Text(
                    '2021-01-01 10:30:31',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            color: Colors.pink,
            icon: const Icon(Icons.favorite),
            tooltip: 'Favorite',
            onPressed: () {
            },
          ),
          /*3*/
        ],
      ),
    );

    Widget viewPhone = Container(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 1),
                  child:
                  Text(
                    'Phone',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child:
                  Text(
                    '08152424223',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.local_phone_rounded),
            tooltip: 'Call Now',
            onPressed: () {
            },
          ),
          /*3*/
        ],
      ),
    );

Widget viewEmail = Container(
  padding: const EdgeInsets.only(left: 20),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 1),
              child:
              Text(
                'Email',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child:
              Text(
                'dummy@test.com',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Divider(
                color: Colors.black
            ),
          ],
        ),
      ),
      IconButton(
        icon: const Icon(Icons.mail),
        tooltip: 'Sent Mail',
        onPressed: () {
        },
      ),
      /*3*/
    ],
  ),
);

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
