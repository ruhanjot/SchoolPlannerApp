import 'dart:core';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

import '../data/agenda_list_info.dart';
import '../data/subject_to_color.dart';

class AgendaList extends StatefulWidget {
  @override
  _AgendaListState createState() => _AgendaListState();
}

class _AgendaListState extends State<AgendaList> {
  _AgendaListState();

  Map _listInfo = agendaListInfo;
  final Map<String, Color> _subjectToColor = subjectToColor;
  Color _dismissedRed =  mainBlack;//Color(0x88F44336);

  Dismissible _buildTile(int index, Map listInfo, Map subjectColors) {
    final _currentAgendaItem = listInfo["items"][index];
    return Dismissible(
        key: Key(UniqueKey().toString()),
        onDismissed: (direction) {
          setState(() {
            listInfo["items"].remove(_currentAgendaItem);
          });
          Scaffold.of(context).showSnackBar(SnackBar(
              backgroundColor: _dismissedRed,
              content: Text(_currentAgendaItem["title"] + " has been deleted.")));
        },
        background: Container(color: _dismissedRed),
        child: ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: 3,
                color: _currentAgendaItem["itemType"] == 'work' ? mainWhite : mainBlack,
              ),
              Icon(
                Icons.label,
                color:
                    subjectColors[_currentAgendaItem["subject"].toLowerCase()],
                // size: 30,
              ),
            ],
          ),
          title: Text(
            _currentAgendaItem["title"],
            style: TextStyle(color: mainWhite),
          ),
          trailing: IconButton(
              icon: Icon(
                _currentAgendaItem["isImportant"]
                    ? Icons.star
                    : Icons.star_border,
                color: _currentAgendaItem["isImportant"]
                    ? highlightGreen
                    : accentLightGrey,
                //size: 30,
              ),
              onPressed: () {
                setState(() {
                  _currentAgendaItem["isImportant"] =
                      !_currentAgendaItem["isImportant"];
                });
              }),
          onTap: () => {print("Tapped")},
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ));
  }

  Widget _buildRow(int i, Map listInfo, Map subjectColors) {
    if (i.isOdd) {
      return Container(
          child: Divider(
        color: mainWhite,
        height: 0,
        indent: 20,
        endIndent: 20,
      ));
    }
    final int index = i ~/ 2;
    return _buildTile(index, listInfo, subjectColors);
  }

  Widget _buildAgenda(Map listInfo, Map subjectColors) {
    List<Widget> _listChildren = [];
    int itemLength = listInfo["items"].length;
    if (itemLength > 0) {
      for (int i = 0; i < 2 * itemLength - 1; i++) {
        _listChildren.add(_buildRow(i, listInfo, subjectColors));
      }
    }
    return ListView(
      children: _listChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAgenda(_listInfo, _subjectToColor);
  }
}
