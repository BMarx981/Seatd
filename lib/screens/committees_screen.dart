import 'package:flutter/material.dart';
import 'package:seatd/models/committee_model.dart';

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
    print(cm.data['results']);
  }

  String _getTitle() {
    if (widget.chamber == 'Joint') {
      return 'Joint Commitees';
    }
    return 'Commitees for the ${widget.chamber}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getTitle(),
        ),
      ),
      body: Container(
        child: Text(
          'Committes',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
