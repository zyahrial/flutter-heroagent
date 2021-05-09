import 'package:flutter/material.dart';
String horseUrl = 'https://i.stack.imgur.com/Dw6f7.png';
String cowUrl = 'https://i.stack.imgur.com/XPOr3.png';
String camelUrl = 'https://i.stack.imgur.com/YN0m7.png';
String sheepUrl = 'https://i.stack.imgur.com/wKzo8.png';
String goatUrl = 'https://i.stack.imgur.com/Qt4JP.png';
class LeadsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          // leading: CircleAvatar(
          //   backgroundImage: NetworkImage(horseUrl),
          // ),
          title: Text('Dummy 1'),
          subtitle: Text('Email'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('horse');
          },
          selected: true,
        ),
        ListTile(
          // leading: CircleAvatar(
          //   backgroundImage: NetworkImage(goatUrl),
          // ),
          title: Text('Dummy 1'),
          subtitle: Text('Some have horns'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('goat');
          },
        ),
      ],
    );
  }
}