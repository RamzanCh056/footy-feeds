import 'package:flutter/material.dart';
import 'package:footy_feed/Pages/splash.dart';


void main()  {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      Splash(),
    );
    // FutureBuilder(
    //   future: Firebase.initializeApp(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       print('Something went Wrong');
    //     }
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     if (snapshot.hasData) {
    //       print('Firebase connected');
    //     }
    //     return MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       home: Splash(),
    //     );
    //   },
    // );
  }
}
