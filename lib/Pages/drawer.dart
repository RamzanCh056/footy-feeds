
import 'package:flutter/material.dart';
import 'package:footy_feed/Pages/calendar.dart';
import 'package:footy_feed/Pages/head_to_head_stats.dart';
import 'package:footy_feed/Pages/match_preview.dart';
import 'package:footy_feed/Pages/settings.dart';

class MyDrawerPage extends StatefulWidget {
  @override
  State<MyDrawerPage> createState() => _MyDrawerPageState();
}

class _MyDrawerPageState extends State<MyDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/dp.png'),
              )),
          ListTile(
            title: Text(
              'Match Preview',
              style: TextStyle(fontSize: 16),
            ),
            leading: Icon(
              Icons.preview_sharp,
              // color: Colors.indigo,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MatchPreview()));
            },
          ),
          ListTile(
            title: Text(
              'Head To Head Stats',
              style: TextStyle(fontSize: 16),
            ),
            leading: Icon(
              Icons.query_stats,
              // color: Colors.indigo,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HeadToHeadStatistics()));
            },
          ),
          ListTile(
            title: Text(
              'Calendar',
              style: TextStyle(fontSize: 16),
            ),
            leading: Icon(
              Icons.calendar_month,
              // color: Colors.indigo,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Calendarr()));
            },
          ),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            leading: Icon(
              Icons.settings,
              // color: Colors.indigo,
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
          ),
        ],
      ),
    );
  }
}
