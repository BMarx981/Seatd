import 'package:flutter/material.dart';

class BillsScreen extends StatefulWidget {
  BillsScreen({this.chamber});
  String chamber;
  static const String id = 'bills';
  @override
  _BillsScreenState createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bills for the ${widget.chamber}'),
      ),
      body: Container(
        child: Text(
          'Bills',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
