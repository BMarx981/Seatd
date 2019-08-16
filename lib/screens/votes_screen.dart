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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Votes for the ${widget.chamber}'),
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
