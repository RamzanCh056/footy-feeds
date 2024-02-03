import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.green,
        title: Text(
          'App Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
              //       'Info',
              //       style: TextStyle(
              //           // color: Colors.indigo,
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold),
              //     ),
              //     Spacer(),
              //     Spacer(),
              //   ],
              // ),
              SizedBox(height: 20),
              Text(
                'Stay ahead of the game with our expert analysis, pre and post-match insights, and exclusive interviews. Enjoy a rich library of articles, and the latest news of the football world..',
                style: TextStyle(
                    // color: Colors.indigo,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
