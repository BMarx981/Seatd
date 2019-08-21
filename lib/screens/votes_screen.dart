import 'package:flutter/material.dart';
import 'package:seatd/models/votes_model.dart';

class VotesScreen extends StatefulWidget {
  VotesScreen(
      {Key key,
      @required this.chamber,
      @required this.congressNum,
      @required this.vm})
      : super(key: key);
  final String chamber;
  final String congressNum;
  final VotesModel vm;
  static const String id = 'votes';
  @override
  _VotesScreenState createState() => _VotesScreenState();
}

class _VotesScreenState extends State<VotesScreen> {
  VotesModel vm;
  String title = '';
  @override
  initState() {
    super.initState();
    vm = widget.vm;
    _getTitle();
  }

  String _getTitle() {
    if (widget.chamber == 'Joint') {
      return 'Joint Votes';
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
          'Votes',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
