import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:heroagent/network_utils/api.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:heroagent/assets/leads_detail.dart';

// Future<List<Leads>> fetchLeads() async {
Future<List<Leads>> fetchLeads() async {
  final response = await Network().getData('/api/leads/TEST001');
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((leads) => new Leads.fromJson(leads)).toList();
  } else {
    throw Exception('Failed to load leads from API');
  }

}

List<Leads> parseLeads(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Leads>((json) => Leads.fromJson(json)).toList();
}

class Leads{
  final String created_at;
  final String lead_id;
  final String name;
  final String email;
  final String phone_number;
  final String media;
  final String channel;

  Leads({this.created_at,this.lead_id,this.name,this.email,this.phone_number,this.media,this.channel});

  factory Leads.fromJson(Map<String, dynamic> json) {
    return Leads(
      created_at: json['created_at'] as String,
      lead_id: json['lead_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone_number: json['phone_number'] as String,
      media: json['media'] as String,
      channel: json['channel'] as String,
    );
  }
}
class LeadsList extends StatefulWidget {
  @override
  _LeadsList createState() => _LeadsList();
}

// class ListTest extends StatefulWidget {
//   @override
//   _LeadsList createState() => new _LeadsList();
// }
class _LeadsList extends State<LeadsList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String lead_id;
  @override
  void initState() {
    // fetchLeads;
    super.initState();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leads List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Leads'),
        ),
        body: Center(
            child: LeadsListView(),
        ),
      ),
    );
  }
}
class LeadsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListTile _tile(String name, String phone_number, String media) =>
        ListTile(
          title: Text(name ?? ""),
          subtitle: Text(phone_number ?? ""),
          leading: CircleAvatar(child: Text('A')),
          trailing: Icon(
              media == 'LP-CALL' ? Icons.local_phone : media == 'LP-CHAT'
                  ? Icons
                  .chat
                  : Icons.text_format),
          onTap: () {
            // setState((){
            //   lead_id = index; //if you want to assign the index somewhere to check
            // });
            // _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text("You clicked item number $_id")));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LeadsDetail(),
              ),
            );
          },
        );

    ListView _leadsListView(data) {
      // final name_icon = data[index].name;
      return ListView.builder(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _tile(
                data[index].name, data[index].phone_number, data[index].media);
          });
    }
    return FutureBuilder<List<Leads>>(
      future: fetchLeads(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Leads> data = snapshot.data;
          return _leadsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}


