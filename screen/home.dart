import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:heroagent/screen/login.dart';
import 'package:heroagent/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:heroagent/widgets/nav-drawer.dart';
import 'package:heroagent/assets/overdue_list.dart';
import 'package:heroagent/assets/leads_list.dart';
import 'package:heroagent/assets/admin_dashboard.dart';
import 'package:heroagent/assets/sales_dashboard.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  var  name;
  var  mytoken;
  int currentTabIndex = 0;

  List<Widget> tabs = [
    AdminDashboard(),
    SalesDashboard(),
    OverdueList(),
    LeadsList()
  ];
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  void initState(){
    _loadUserData();
    super.initState();
  }

  _loadUserData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    var token = jsonDecode(localStorage.getString('token'));
    if(user != null) {
      setState(() {
        name = user['name'];
      });
    }
    if(token != null) {
      setState(() {
        mytoken = token['token'];
      });
    }else{
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Login()));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
        backgroundColor: Colors.teal,
      ),
      drawer: NavDrawer(),

      body: tabs[currentTabIndex],
      bottomNavigationBar: new Theme(
      data: Theme.of(context).copyWith(
      // sets the background color of the `BottomNavigationBar`
      canvasColor: Colors.green,
      // sets the active color of the `BottomNavigationBar` if `Brightness` is light
      primaryColor: Colors.red,
      textTheme: Theme
          .of(context)
          .textTheme
          .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
      child: new BottomNavigationBar(
      onTap: onTapped,
        currentIndex: currentTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            title: Text("Admin Dashboard"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text("Sales Dashboard"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Leads"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text("Leads Over Due"),
          )
        ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new FloatingActionButton(
        // onPressed:(){ _incrementTab(1); },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

  // void logout() async{
  //   var res = await Network().getData('/auth/logout');
  //   var body = json.decode(res.body);
  //   if(body['success']){
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     localStorage.remove('user');
  //     localStorage.remove('token');
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context)=>Login()));
  //   }
  // }
}