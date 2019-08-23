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
  final Map _listInfo = agendaListInfo;
  final Map _subjectToColor = subjectToColor;

  ListTile _buildTile(int index, Map listInfo, Map subjectColors) {
    final _currentAgendaItem = listInfo["items"][index];
    return ListTile(
        leading: Icon(
          Icons.label,
          color: subjectColors[_currentAgendaItem["subject"].toLowerCase()],
          // size: 30,
        ),
        title: Text(
          _currentAgendaItem["title"],
          style: TextStyle(color: mainWhite),
        ),
        trailing: IconButton(
            icon: Icon(
                _currentAgendaItem["isFavorited"]
                    ? Icons.star
                    : Icons.star_border,
                color: _currentAgendaItem["isFavorited"]
                    ? highlightGreen
                    : accentLightGrey,
                //size: 30,
                ),
            onPressed: () {
              setState(() {
                _currentAgendaItem["isFavorited"] =
                    !_currentAgendaItem["isFavorited"];
              });
            }),
        onTap: () => {print("tapped!")},
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        );
  }

  Widget _buildRow(int i, Map listInfo, Map subjectColors) {
    if (i.isOdd) {
      return Container(
          child: Divider(
            color: mainWhite,
            height: 0,
            indent: 20,
            endIndent: 20,
          )
      );
    }
    final int index = i ~/ 2;
    return Ink(
      color: accentGrey, child: _buildTile(index, listInfo, subjectColors));
  }

  Widget _buildAgenda(Map listInfo, Map subjectColors) {
    List<Widget> listChildren = [];
    for (int i = 0; i < 2 * listInfo["items"].length - 1; i++) {
      listChildren.add(_buildRow(i, listInfo, subjectColors));
    }
    return ListView(
      children: listChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAgenda(_listInfo, _subjectToColor);
  }
}
