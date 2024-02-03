
import 'package:flutter/material.dart';
import 'package:footy_feed/Pages/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> liveScore = {};

  bool isScoreLoading = true;

  MatchScore() async {
    var request1 = http.Request(
        'GET',
        Uri.parse(
            'https://api.soccerdataapi.com/match/?match_id=909713&auth_token=184c67b6e6f546650bee35d2ee6b8e1aba9f04a4'));

    http.StreamedResponse response = await request1.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      liveScore = body;
      setState(() {
        liveScore;
        print('Match Data = $liveScore');
        isScoreLoading = false;
      });
      if (liveScore.isEmpty) {
        print('No data found.');
      }
    } else {
      print(response.reasonPhrase);
      setState(() {
        isScoreLoading = false;
      });
    }
  }

  @override
  void initState() {
    MatchScore();

    super.initState();
  }

  final List<Map<String, String>> sportsImages = [
    {
      'url': 'images/footballmatch.jpg',
      'quote': 'Champions keep playing until they get it right.',
    },
    {
      'url': 'images/match.jpg',
      'quote':
          'It\'s not whether you get knocked down, it\'s whether you get up.',
    },
    {
      'url': 'images/match2.jpg',
      'quote': 'Hard work beats talent when talent doesn\'t work hard.',
    },
  ];
  final CarouselController _carouselController = CarouselController();
  File? image;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  //  _scaffoldKey.currentState!.openDrawer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.green,
        title: Text(
          'Football Match',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: MyDrawerPage(),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
              height: 150,
              width: double.infinity,
              child: CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: sportsImages.length,
                options: CarouselOptions(
                  aspectRatio: 0.8,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    // Update the current page index when the page changes
                    setState(() {
                      index = index;
                    });
                  },
                ),
                itemBuilder: (ctx, index, realIdx) {
                  return SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                  sportsImages[index]['url'].toString()),
                              //  opacity: 0.6,
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: double.infinity,
                        ),
                        Positioned(
                            top: 62,
                            left: 10,
                            right: 10,
                            child: Text(
                              sportsImages[index]['quote'].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ))
                      ],
                    ),
                  );
                },
              )),
          DotsIndicator(
            dotsCount: sportsImages.length,
            position: 1,
            decorator: const DotsDecorator(
              color: Color(0xffD4D4D6), // Inactive color
              activeColor: Colors.grey,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Match details',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          SizedBox(
            height: 18,
          ),
          isScoreLoading
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      if (liveScore == null) {
                        return Text('null no data here');
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 22.0, right: 22, top: 12),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300, // Background color
                              borderRadius: BorderRadius.circular(
                                  20.0), // Rounded corners
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Country',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['country']['name'],
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'League',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['league']['name'],
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Stage',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stage']['name'],
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Teams Home',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['teams']['home']['name'],
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Team Away',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['teams']['away']['name'],
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Stadium',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stadium']['name'],
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Match Preview',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['match_preview']
                                                  ['excitement_rating']
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
        ],
      )),
    );
  }
}
