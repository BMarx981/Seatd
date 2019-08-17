import 'package:flutter/material.dart';

class VotesScreen extends StatefulWidget {
  VotesScreen({
    this.chamber,
  });
  static const String id = 'votes';
  String chamber;
  @override
  _VotesScreenState createState() => _VotesScreenState();
}

class _VotesScreenState extends State<VotesScreen> {
  String _getTitle() {
    if (widget.chamber == 'Joint') {
      return 'Joint Statements';
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
