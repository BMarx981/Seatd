import 'package:flutter/material.dart';
import 'committees_screen.dart';
import 'package:seatd/models/committee_model.dart';
import 'members_screen.dart';
import 'package:seatd/models/members_model.dart';
import 'bills_screen.dart';
import 'package:seatd/models/bills_model.dart';
import 'votes_screen.dart';
import 'package:seatd/models/votes_model.dart';
import 'statements_screen.dart';
import 'package:seatd/models/statements_model.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

//const String url = 'https://api.propublica.org/congress/v1/115/senate/members.json';
//const String url =
//    'https://api.propublica.org/congress/v1/house/votes/recent.json';
const String url = '';
const List<String> congressNumbers = [
  '116',
  '115',
  '114',
  '113',
  '112',
  '111',
  '110',
];

class SeatdHomePage extends StatefulWidget {
  static const String id = 'seatd';
  SeatdHomePage({Key key}) : super(key: key);

  final String title = "Congressional Info App";
  @override
  _SeatdHomePageState createState() => _SeatdHomePageState();
}

class _SeatdHomePageState extends State<SeatdHomePage> {
  bool houseSelected = true;
  bool senateSelected = false;
  var selectedCongress = '116';
  dynamic data;

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
                    selectedCongress: selectedCongress,
                  ),
                  ListViewContainer(
                    text: 'Members',
                    chamber: _getChamber(),
                    selectedCongress: selectedCongress,
                  ),
                  ListViewContainer(
                    text: 'Bills',
                    chamber: _getChamber(),
                    selectedCongress: selectedCongress,
                  ),
                  ListViewContainer(
                    text: 'Votes',
                    chamber: _getChamber(),
                    selectedCongress: selectedCongress,
                  ),
                  ListViewContainer(
                    text: 'Statements',
                    chamber: _getChamber(),
                    selectedCongress: selectedCongress,
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
  final String selectedCongress;
  ListViewContainer({
    Key key,
    this.text,
    this.chamber,
    this.selectedCongress,
    boxColor = Colors.white,
  }) : super(key: key);

  String _buildURL(String category) {
    String url = '';
    switch (category) {
      case 'committees':
        url =
            'https://api.propublica.org/congress/v1/${selectedCongress.toLowerCase()}/${chamber.toLowerCase()}/${text.toLowerCase()}.json';
        break;
      case 'members':
        url =
            'https://api.propublica.org/congress/v1/${selectedCongress.toLowerCase()}/${chamber.toLowerCase()}/members.json';
        break;
      case 'bills':
        url =
            'https://api.propublica.org/congress/v1/bills/search.json?query={query}';
        break;
      case 'statements':
        url = 'https://api.propublica.org/congress/v1/statements/latest.json';
        break;
      case 'votes':
        url =
            'https://api.propublica.org/congress/v1/$chamber/votes/recent.json';
    }
    return url;
  }

  _navigateToNextScreen(String name, BuildContext context) async {
    switch (name) {
      case 'Committees':
        CommitteeModel cm = CommitteeModel();
        await cm.getNetworkData(
          _buildURL('committees'),
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CommitteesScreen(
              chamber: chamber,
              congressNum: selectedCongress,
              cm: cm,
            ),
          ),
        );
        break;
      case 'Members':
        MembersModel mm = MembersModel();
        await mm.getNetworkData(
          _buildURL('members'),
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MembersScreen(
              chamber: chamber,
              congressNum: selectedCongress,
              mm: mm,
            ),
          ),
        );
        break;
      case 'Bills':
        BillsModel bm = BillsModel();
        await bm.getNetworkData(
          _buildURL('bills'),
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BillsScreen(
              chamber: chamber,
              congressNum: selectedCongress,
              bm: bm,
            ),
          ),
        );
        break;
      case 'Votes':
        VotesModel vm = VotesModel();
        await vm.getNetworkData(
          _buildURL('votes'),
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VotesScreen(
              chamber: chamber,
              congressNum: selectedCongress,
              vm: vm,
            ),
          ),
        );
        break;
      case 'Statements':
        StatementsModel sm = StatementsModel();
        await sm.getNetworkData(
          _buildURL('statements'),
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StatementsScreen(
              chamber: chamber,
              congressNum: selectedCongress,
              sm: sm,
            ),
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
            padding: EdgeInsets.fromLTRB(
              18.0,
              8,
              18.0,
              20,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 50.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
