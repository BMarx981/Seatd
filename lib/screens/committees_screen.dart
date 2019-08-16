import 'package:flutter/material.dart';
import 'package:seatd/network_helper.dart';

class CommittesScreen extends StatefulWidget {
  CommittesScreen({this.chamber});
  final String chamber;
  static const String id = 'committes';
  @override
  _CommittesScreenState createState() => _CommittesScreenState();
}

class _CommittesScreenState extends State<CommittesScreen> {
  NetworkHelper nh = NetworkHelper('https://api.propublica.org/congress/v1/115/${widget.chamber}/committees.json');
  dynamic data =
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
