import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.green,
        title: Text(
          'Privacy',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22.0),
          child: Column(
            children: [
              // Row(
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         Navigator.pop(context);
              //       },
              //       child: Icon(
              //         Icons.arrow_back,
              //         // color: Colors.indigo,
              //         size: 30,
              //       ),
              //     ),
              //     Spacer(),
              //     Text(
              //       'Privacy',
              //       style: TextStyle(
              //           // color: Colors.indigo,
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold),
              //     ),
              //     Spacer(),
              //     Spacer(),
              //   ],
              // ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Please review our Privacy Policy to understand how we collect, use, and protect data while using the app.',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
