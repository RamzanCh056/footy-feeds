import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MatchPreview extends StatefulWidget {
  const MatchPreview({super.key});

  @override
  State<MatchPreview> createState() => _MatchPreviewState();
}

class _MatchPreviewState extends State<MatchPreview> {
  Map<String, dynamic> liveScore = {};

  bool isScoreLoading = true;

  MatchScore() async {
    var request1 = http.Request(
        'GET',
        Uri.parse(
            'https://api.soccerdataapi.com/match-preview/?match_id=909713&auth_token=184c67b6e6f546650bee35d2ee6b8e1aba9f04a4'));

    http.StreamedResponse response = await request1.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      liveScore = body;
      setState(() {
        liveScore;
        print('Match Preview = $liveScore');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.green,
        title: Text(
          'Match Preview',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          isScoreLoading
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: liveScore.length,
                    itemBuilder: (context, index) {
                      if (liveScore == null) {
                        return Text('null no data here');
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 22.0, right: 22, top: 12, bottom: 5),
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
                                      Expanded(
                                        child: Text(
                                          liveScore['preview_content'][0]
                                                  ['content']
                                              .toString(),
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
      ),
    );
  }
}
