import 'dart:core';
import 'package:flutter/material.dart';

import '../UI/important_agenda_list.dart';

import '../utils/constants.dart';

import '../data/agenda_list_info.dart';
import '../data/subject_to_color.dart';

class ImportantAgendaPage extends StatefulWidget {
  @override
  _ImportantAgendaPageState createState() => _ImportantAgendaPageState();
}

class _ImportantAgendaPageState extends State<ImportantAgendaPage> {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Important Agenda',
          style: TextStyle(fontSize: 25, color: accentLightGrey),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star, color: highlightGreen),
            onPressed: _handleNonFavoritePress,
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
        child: ImportantAgendaList()
      ),
    );
  }
  void _handleNonFavoritePress(){
     Navigator.of(context).pop();
  }
}