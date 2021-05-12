import 'package:flutter/material.dart';

class OverdueList extends StatefulWidget {
  @override
  _OverdueList createState() => _OverdueList();
}

class _OverdueList extends State<OverdueList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String lead_id;
  String dropdownValue = 'Agent One';
  String statusValue = 'Contacted';
  String attempValue = '1';

  List <String> spinnerItems = [
    'Agent One',
    'Agent Two Agent Two ',
    'Agent Three'
  ] ;

  List <String> statusItems = [
    'Contacted',
    'Invalid Number',
    'Relevant'
  ] ;

  List <String> attempItems = [
    '1',
    '2',
    '3'
  ] ;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    // Color color = Theme
    //     .of(context)
    //     .primaryColor;
    // Widget buttonSection = Container(
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       _buildButtonColumn(color, Icons.call, 'CALL'),
    //       _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
    //       _buildButtonColumn(color, Icons.share, 'SHARE'),
    //     ],
    //   ),
    // );
    Widget viewAssign = Container(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 1),
                  child:
                  Text(
                    'Assigned To',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                padding: const EdgeInsets.only(bottom: 8, top: 2),
                child:
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  // style: TextStyle(color: Colors.black, fontSize: 16),
                  isExpanded: true,
                  style: TextStyle(color: Colors.deepPurple, fontSize: 16.0),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String data) {
                    setState(() {
                      dropdownValue = data;
                    });
                  },
                  items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: SizedBox(
                        // width: 100.0, // for example
                        child: Text(value, textAlign: TextAlign.center),
                      ),
                      value: value,
                    );
                  }).toList(),
                ),
                ),
                Divider(
                    color: Colors.black
                ),
              ],
            ),
          ),
          /*3*/
        ],
      ),
    );
    Widget viewStatus = Container(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 1),
                  child:
                  Text(
                    'Call Status',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                padding: const EdgeInsets.only(bottom: 8, top: 2),
                child:
                    DropdownButton<String>(
                      value: statusValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      // style: TextStyle(color: Colors.black, fontSize: 16),
                      // underline: Container(
                      //   height: 2,
                      //   color: Colors.deepPurpleAccent,
                      // ),
                      isExpanded: true,
                      style: TextStyle(color: Colors.deepPurple, fontSize: 16.0),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String data) {
                        setState(() {
                          statusValue = data;
                        });
                      },
                      items: statusItems.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          child: SizedBox(
                            // width: 100.0, // for example
                            child: Text(value, textAlign: TextAlign.center),
                          ),
                          value: value,
                        );
                      }).toList(),
                    ),
                ),
                Divider(
                    color: Colors.black
                ),
              ],
            ),
          ),
          /*3*/
        ],
      ),
    );
    Widget viewAttemp = Container(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 1),
                  child:
                  Text(
                    'Call Attemp',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8, top: 2),
                  child:
                  DropdownButton<String>(
                    value: attempValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    // style: TextStyle(color: Colors.black, fontSize: 16),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    isExpanded: true,
                    style: TextStyle(color: Colors.deepPurple, fontSize: 16.0),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String data) {
                      setState(() {
                        attempValue = data;
                      });
                    },
                    items: attempItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        child: SizedBox(
                          // width: 100.0, // for example
                          child: Text(value, textAlign: TextAlign.center),
                        ),
                        value: value,
                      );
                    }).toList(),
                  ),
                ),
                Divider(
                    color: Colors.black
                ),
              ],
            ),
          ),
          /*3*/
        ],
      ),
    );
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Flutter layout demo'),
        // ),
        // body: Center(
        //   child: Text('Hello World'),
        body: Center(
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            viewName,
            viewPhone,
            viewEmail,
            viewAttr,
            viewMedia,
            viewAssign,
            viewStatus,
            viewAttemp,
            // buttonSection,
          ],
        ),
      ),
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
          mainAxisSize: MainAxisSize.max,
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
          mainAxisSize: MainAxisSize.max,
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
              mainAxisSize: MainAxisSize.max,
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

Widget viewAttr = Container(
  padding: const EdgeInsets.only(left: 20),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 1),
              child:
              Text(
                'Nama Perusahaan',
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
                'PT. DUMMY DATA',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 1),
              child:
              Text(
                'Jabatan',
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
                'Owner',
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
      /*3*/
    ],
  ),
);


Widget viewMedia = Container(
  padding: const EdgeInsets.only(left: 20),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 1),
              child:
              Text(
                'Source',
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
                'FB',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 1),
              child:
              Text(
                'Media',
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
                'LP-FORM',
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
      /*3*/
    ],
  ),
);




// Column _buildButtonColumn(Color color, IconData icon, String label) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Icon(icon, color: color),
//       Container(
//         margin: const EdgeInsets.only(top: 8),
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//             color: color,
//           ),
//         ),
//       ),
//     ],
//   );
// }
