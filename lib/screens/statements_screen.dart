import 'package:flutter/material.dart';

class StatementsScreen extends StatefulWidget {
  StatementsScreen({this.chamber});
  static const String id = 'committes';
  String chamber;
  @override
  _StatementsScreenState createState() => _StatementsScreenState();
}

class _StatementsScreenState extends State<StatementsScreen> {
  String _getTitle() {
    if (widget.chamber == 'Joint') {
      return 'Joint Statements';
    }
    return 'Statements for the ${widget.chamber}';
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
          'Statements',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
