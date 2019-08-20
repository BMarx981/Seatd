import 'package:flutter/material.dart';
import 'package:seatd/network_helper.dart';
import 'committees_screen.dart';
import 'members_screen.dart';
import 'bills_screen.dart';
import 'votes_screen.dart';
import 'statements_screen.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

//const String url = 'https://api.propublica.org/congress/v1/115/senate/members.json';
const String url =
    'https://api.propublica.org/congress/v1/house/votes/recent.json';
const List<String> congressNumbers = [
  '110',
  '111',
  '112',
  '113',
  '114',
  '115',
  '116'
];

class SeatdHomePage extends StatefulWidget {
  static const String id = 'seatd';
  SeatdHomePage({Key key}) : super(key: key);

  final String title = "Congressional Info App";
  @override
  _SeatdHomePageState createState() => _SeatdHomePageState();
}

class _SeatdHomePageState extends State<SeatdHomePage> {
  NetworkHelper nh = NetworkHelper.url(url: url);
  bool houseSelected = true;
  bool senateSelected = false;
  String selectedCongress = '';
  dynamic data;
  _getDataFromHelper() async {
    data = await nh.getData();
  }

  String _getChamber() {
    String selected = '';
    if (houseSelected && !senateSelected) {
      selected = 'House';
    } else if (!houseSelected && senateSelected) {
      selected = 'Senate';
    } else if (houseSelected && senateSelected) {
      selected = 'Joint';
    }
    return selected;
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String congress in congressNumbers) {
      var newItem = DropdownMenuItem(child: Text(congress), value: congress);
      dropDownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCongress,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCongress = value;
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String congress in congressNumbers) {
      pickerItems.add(Text(
        congress,
        style: TextStyle(color: Colors.black),
      ));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlueAccent,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedItem) {
        setState(() {
          selectedCongress = congressNumbers[selectedItem];
        });
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    child: Text(
                      "Select a Congress",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Select Congress
            Expanded(
              flex: 1,
              child: Container(
                height: 15.0,
                child: Platform.isIOS ? iOSPicker() : androidDropdown(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    child: Text(
                      "Select a Chamber",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Select chamber
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
                          houseSelected = !houseSelected;
                        });
                        if (!senateSelected && !houseSelected) {
                          senateSelected = !senateSelected;
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: houseSelected
                                ? Colors.black
                                : Colors.grey.withOpacity(0),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                          color: houseSelected ? Colors.blue : Colors.lightBlue,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'House',
                              style: TextStyle(
                                fontSize: 40.0,
                                color: houseSelected
                                    ? Colors.black
                                    : Colors.black.withOpacity(.4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          senateSelected = !senateSelected;
                        });
                        if (!houseSelected && !senateSelected) {
                          houseSelected = !houseSelected;
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: senateSelected
                                ? Colors.black
                                : Colors.grey.withOpacity(0),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                          color: senateSelected ? Colors.red : Colors.redAccent,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Senate',
                              style: TextStyle(
                                fontSize: 40.0,
                                color: senateSelected
                                    ? Colors.black
                                    : Colors.black.withOpacity(.4),
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
            //List of choices
            Expanded(
              flex: 5,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  ListViewContainer(
                    text: 'Committees',
                    chamber: _getChamber(),
                  ),
                  ListViewContainer(
                    text: 'Members',
                    chamber: _getChamber(),
                  ),
                  ListViewContainer(
                    text: 'Bills',
                    chamber: _getChamber(),
                  ),
                  ListViewContainer(
                    text: 'Votes',
                    chamber: _getChamber(),
                  ),
                  ListViewContainer(
                    text: 'Statements',
                    chamber: _getChamber(),
                  ),
                ],
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
    switch (name) {
      case 'Committees':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CommitteesScreen(chamber: chamber),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(
              18.0,
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
          Separator(),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 8.0),
      child: Container(
        child: Text(
          '________________________________________________________',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
