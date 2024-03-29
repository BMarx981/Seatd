import 'package:flutter/material.dart';
import 'package:seatd/models/committee_model.dart';
import 'package:seatd/screens/committee_detail.dart';

class CommitteesScreen extends StatefulWidget {
  CommitteesScreen(
      {Key key,
      @required this.chamber,
      @required this.congressNum,
      @required this.cm})
      : super(key: key);
  final String chamber;
  final String congressNum;
  final CommitteeModel cm;
  static const String id = 'committes';
  @override
  _CommitteesScreenState createState() => _CommitteesScreenState();
}

class _CommitteesScreenState extends State<CommitteesScreen> {
  CommitteeModel cm;
  String title = '';
  @override
  initState() {
    super.initState();
    cm = widget.cm;
    _getTitle();
  }

  String _getTitle() {
    if (widget.chamber == 'Joint') {
      return 'Joint Commitees';
    }
    return 'Commitees for the ${widget.chamber}';
  }

  List<Widget> _getCommittees() {
    List<Widget> list = [];
    list.add(
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Committes:',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
    for (var com in cm.commitList) {
      list.add(
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CommitteeDetail(
                  data: com,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      com.name,
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Chair: ${com.chair} (${com.chairParty})',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getTitle(),
        ),
      ),
      body: ListView(
        children: _getCommittees(),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
