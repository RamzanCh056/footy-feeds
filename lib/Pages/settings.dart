


import 'package:flutter/material.dart';
import 'package:footy_feed/Pages/info.dart';
import 'package:footy_feed/Pages/privacy_page.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.green,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
         
            SizedBox(
              height: 20,
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios,
                // color: Colors.indigo,
              ),
              title: Text(
                'privacy',
                style: TextStyle(
                  fontSize: 16,
                  // color: Colors.indigo,
                ),
              ),
              leading: Icon(
                Icons.privacy_tip,
                // color: Colors.indigo,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrivacyScreen()));
              },
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
              title: Text(
                'App Info',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              leading: Icon(
                Icons.info,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AppInfo()));
              },
            ),
            ListTile(
              trailing: Text('1.0',style: TextStyle(fontSize: 16),),
              title: Text(
                'App Version',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              leading: Icon(
                Icons.verified_user,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
