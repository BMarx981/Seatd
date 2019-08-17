import 'package:flutter/material.dart';

class BillsScreen extends StatefulWidget {
  BillsScreen({Key key, @required this.chamber}) : super(key: key);
  final String chamber;
  static const String id = 'bills';
  @override
  _BillsScreenState createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  String _getTitle() {
    if (widget.chamber == 'Joint') {
      return 'Joint Statements';
    }
    return 'Bills for the ${widget.chamber}';
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
          'Bills',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
