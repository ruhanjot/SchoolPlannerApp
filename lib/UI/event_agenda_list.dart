// import 'package:flutter/material.dart';

// import '../utils/constants.dart';

// class EventAgendaListTile extends StatefulWidget {
//   Map listData;
//   final Map<String, Color> subjectColors;
//   EventAgendaListTile(this.listData, this.subjectColors);

//   @override
//   _EventAgendaListTileState createState() => _EventAgendaListTileState(listData, subjectColors);
// }

// class _EventAgendaListTileState extends State<EventAgendaListTile> {
  
//   Map listData;
//   final Map<String, Color> subjectColors;
//   _EventAgendaListTileState(this.listData, this.subjectColors);
 
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(
//         Icons.label,
//         color: subjectColors[listData["subject"].toLowerCase()],
//         // size: 30,
//       ),
//       title: Text(
//         listData["title"],
//         style: TextStyle(color: mainWhite),
//       ),
//       trailing: IconButton(
//           icon: Icon(
//             listData["isImportant"] ? Icons.star : Icons.star_border,
//             color: listData["isImportant"] ? highlightGreen : accentLightGrey,
//             //size: 30,
//           ),
//           onPressed: () {
//             setState(() {
//               listData["isImportant"] = !listData["isImportant"];
//             });
//           }),
//       onTap: () => {print("Tapped")},
//       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//     );
//   }
// }
