import 'package:flutter/material.dart';
import 'package:seatd/network_helper.dart';
import 'committees_screen.dart';
import 'members_screen.dart';
import 'bills_screen.dart';
import 'votes_screen.dart';
import 'statements_screen.dart';

//const String url = 'https://api.propublica.org/congress/v1/115/senate/members.json';
const String url =
    'https://api.propublica.org/congress/v1/house/votes/recent.json';

class SeatdHomePage extends StatefulWidget {
  static const String id = 'seatd';
  SeatdHomePage({Key key}) : super(key: key);

  final String title = "Congressional Info App";
  @override
  _SeatdHomePageState createState() => _SeatdHomePageState();
}

class _SeatdHomePageState extends State<SeatdHomePage> {
  NetworkHelper nh = NetworkHelper(url);
  bool selected = true;
  dynamic data;
  _getDataFromHelper() async {
    data = await nh.getData();
  }

  String _getChamber() {
    return selected ? 'house' : 'senate';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ListViewContainer(
                    text: 'Committes',
                    chamber: _getChamber(),
                  ),
                  Separator(),
                  ListViewContainer(
                    text: 'Members',
                    chamber: _getChamber(),
                  ),
                  Separator(),
                  ListViewContainer(
                    text: 'Bills',
                    chamber: _getChamber(),
                  ),
                  Separator(),
                  ListViewContainer(
                    text: 'Votes',
                    chamber: _getChamber(),
                  ),
                  Separator(),
                  ListViewContainer(
                    text: 'Statements',
                    chamber: _getChamber(),
                  ),
                  Separator(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 20, 16.0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!selected) {
                            selected = !selected;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selected
                                ? Colors.black
                                : Colors.grey.withOpacity(0),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                          color: selected ? Colors.blue : Colors.lightBlue,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'House',
                              style: TextStyle(
                                fontSize: 40.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selected) {
                            selected = !selected;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: !selected
                                ? Colors.black
                                : Colors.grey.withOpacity(0),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                          color: !selected ? Colors.red : Colors.redAccent,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Senate',
                              style: TextStyle(
                                fontSize: 40.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewContainer extends StatelessWidget {
  final String text;
  final String chamber;
  ListViewContainer({
    Key key,
    this.text,
    this.chamber,
  }) : super(key: key);

  _navigateToNextScreen(String name, BuildContext context) {
    print(name);
    switch (name) {
      case 'Committes':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CommittesScreen(chamber: chamber),
          ),
        );
        break;
      case 'Members':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MembersScreen(chamber: chamber),
          ),
        );
        break;
      case 'Bills':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BillsScreen(chamber: chamber),
          ),
        );
        break;
      case 'Votes':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VotesScreen(chamber: chamber),
          ),
        );
        break;
      case 'Statements':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StatementsScreen(chamber: chamber),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToNextScreen(text, context);
      },
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(
              38.0,
              8,
              0,
              0,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Separator extends StatelessWidget {
  const Separator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        '____________________________',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 12.0,
        ),
      ),
    );
  }
}
