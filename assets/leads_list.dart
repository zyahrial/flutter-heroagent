import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:heroagent/network_utils/api.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Future<List<Leads>> fetchLeads() async {
Future<List<Leads>> fetchLeads() async {
  final response = await Network().getData('/api/leads/TEST001');
  // List<Leads> list;
  // final response = await Network().getData('/api/leads/TEST001');
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((leads) => new Leads.fromJson(leads)).toList();
  } else {
    throw Exception('Failed to load leads from API');
  }
  // List<Leads> tagObjs = tagObjsJson.map((json) => Leads.fromJson(json)).toList();
  // print(tagObjs);
  // list = rest.map<Leads>((json) => Leads.fromJson(json)).toList();
  // return rest;
  //   var rest = responseJson["leads"] as List;
}

List<Leads> parseLeads(String responseBody) {
  // final responseJson = json.decode(responseBody);
  // final rest = responseJson["leads"];
  // final parsed = jsonDecode(rest).cast<Map<String, dynamic>>();
  // return parsed.map<Leads>((json) => Leads.fromJson(json)).toList();
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
  final String name_icon;

  Leads({this.created_at,this.lead_id,this.name,this.email,this.phone_number,this.media,this.channel,this.name_icon});

  factory Leads.fromJson(Map<String, dynamic> json) {
    return Leads(
      created_at: json['created_at'] as String,
      lead_id: json['lead_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone_number: json['phone_number'] as String,
      media: json['media'] as String,
      channel: json['channel'] as String,
      name_icon: json['name'] as String,
    );
  }
}

class LeadsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

ListView _leadsListView(data) {
  // final name_icon = data[index].name;
  return ListView.builder(
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      // itemBuilder: (context, index) {
      //   return new _ContactListItem(_contacts[index]);
      // },
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tile(data[index].name, data[index].phone_number, data[index].name_icon);
      });
}
ListTile _tile(String name, String phone_number , String name_icon) => ListTile(
  // title: Text(lead_id,
  //     style: TextStyle(
  //       fontWeight: FontWeight.w500,
  //       fontSize: 20,
  //     )),
  // subtitle: Text(phone_number),

  title: Text(name ?? ""),
  subtitle: Text(phone_number ?? ""),
    leading: CircleAvatar(child: Text('A')),
    // leading: CircleAvatar(child: Text('A')),
);

Widget build(BuildContext context) {
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

class LeadsList extends StatefulWidget {
  @override
  _LeadsList createState() => _LeadsList();
}
class _LeadsList extends State<LeadsList> {
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
            child: LeadsListView()
        ),
      ),
    );
  }
}

