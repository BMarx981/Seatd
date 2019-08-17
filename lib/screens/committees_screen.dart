import 'package:flutter/material.dart';
import 'package:seatd/network_helper.dart';

class CommitteesScreen extends StatefulWidget {
  CommitteesScreen({Key key, @required this.chamber}) : super(key: key);
  final String chamber;
  static const String id = 'committes';
  @override
  _CommitteesScreenState createState() => _CommitteesScreenState();
}

class _CommitteesScreenState extends State<CommitteesScreen> {
  NetworkHelper nh = NetworkHelper();
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
