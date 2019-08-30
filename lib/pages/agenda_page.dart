import 'package:flutter/material.dart';
import 'package:school_planner/pages/important_agenda_page.dart';

import '../utils/constants.dart';

import '../UI/agenda_list.dart';

class AgendaPage extends StatefulWidget {
  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agenda',
          style: TextStyle(fontSize: 25, color: accentLightGrey),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star),
            onPressed: _handleFavoritePress,
          )
        ],
        iconTheme: IconThemeData(
            color: accentLightGrey), // to change hamburger icon color
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              onTap: () => {print('Tile')},
            )
          ],
        ),
      ),
      body: Material(
        color: accentGrey,
        child: AgendaList()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {print('Action button pressed')},
        child: Icon(Icons.add, size: 35, color: accentGrey),
      ),
    );
  }
  
  void _handleFavoritePress() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
          return ImportantAgendaPage();
        }));
  }

}


