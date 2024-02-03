import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HeadToHeadStatistics extends StatefulWidget {
  const HeadToHeadStatistics({super.key});

  @override
  State<HeadToHeadStatistics> createState() => _HeadToHeadStatisticsState();
}

class _HeadToHeadStatisticsState extends State<HeadToHeadStatistics> {
  Map<String, dynamic> liveScore = {};

  bool isScoreLoading = true;

  MatchScore() async {
    var request1 = http.Request(
        'GET',
        Uri.parse(
            'https://api.soccerdataapi.com/head-to-head/?team_1_id=4137&team_2_id=4149&auth_token=184c67b6e6f546650bee35d2ee6b8e1aba9f04a4'));

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
          'Head To Head Statistics',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
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
                                      Text(
                                        'Team 1',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['team1']['name'].toString(),
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
                                        'Team 2',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['team2']['name'].toString(),
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
                                        'Overall Games',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['overall']
                                                  ['overall_games_played']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Overall Team1 wins',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['overall']
                                                  ['overall_team1_wins']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Overall Team2 wins',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['overall']
                                                  ['overall_team2_wins']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Overall Draws',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['overall']
                                                  ['overall_draws']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Overall Team1 Scored',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['overall']
                                                  ['overall_team1_scored']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Overall Team2 Scored ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['overall']
                                                  ['overall_team2_scored']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Team1 Played At Home',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['team1_at_home']
                                                  ['team1_games_played_at_home']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Team1 Wins At Home',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['team1_at_home']
                                                  ['team1_wins_at_home']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Team1 Losses At Home',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['team1_at_home']
                                                  ['team1_losses_at_home']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Team1 Draws At Home',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['team1_at_home']
                                                  ['team1_draws_at_home']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Team1 Conceded At Home',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['team1_at_home']
                                                  ['team1_conceded_at_home']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Team2 Played At Home',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['team2_at_home']
                                                  ['team2_games_played_at_home']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Team2 Wins At Home',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['team2_at_home']
                                                  ['team2_wins_at_home']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Team2 Losses At Home',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['team2_at_home']
                                                  ['team2_losses_at_home']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Team2 Draws At Home',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['team2_at_home']
                                                  ['team2_draws_at_home']
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
                                  Row(
                                    children: [
                                      Text(
                                        'Team2 Conceded At Home',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          liveScore['stats']['team2_at_home']
                                                  ['team2_conceded_at_home']
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
