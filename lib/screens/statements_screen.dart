import 'package:flutter/material.dart';
import 'package:seatd/models/statements_model.dart';

class StatementsScreen extends StatefulWidget {
  StatementsScreen({
    Key key,
    @required this.chamber,
    @required this.congressNum,
    @required this.sm,
  }) : super(key: key);
  final String chamber;
  final String congressNum;
  final StatementsModel sm;
  static const String id = 'committes';
  @override
  _StatementsScreenState createState() => _StatementsScreenState();
}

class _StatementsScreenState extends State<StatementsScreen> {
  StatementsModel sm;
  @override
  initState() {
    super.initState();
    sm = widget.sm;
    _getTitle();
  }

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
