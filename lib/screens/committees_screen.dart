import 'package:flutter/material.dart';

class CommittesScreen extends StatefulWidget {
  CommittesScreen({this.chamber});
  String chamber;
  static const String id = 'committes';
  @override
  _CommittesScreenState createState() => _CommittesScreenState();
}

class _CommittesScreenState extends State<CommittesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Commitees for the ${widget.chamber}'),
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
