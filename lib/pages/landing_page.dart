import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../UI/agenda_list.dart';

//import '../utils/constants.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            children: <Widget>[
              Container(
                child: Text(
                  'Agenda',
                  style: TextStyle(fontSize: 25, color: accentLightGrey),
                ),
                padding: EdgeInsets.only(right: 20),
              ),
              Icon(
                Icons.assignment, 
                color: accentLightGrey,
              ),
            ],
          ),
        iconTheme:
            IconThemeData(color: accentLightGrey), // to change hamburger icon color
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              onTap: () => {print("Tile")},
            )
          ],
        ),
      ),
      body: Material(
        color: accentGrey,
        child: AgendaList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {print("Action button pressed")},
        child: Icon(Icons.add, size: 35, color: accentGrey),
      ),
    );
  }
}
