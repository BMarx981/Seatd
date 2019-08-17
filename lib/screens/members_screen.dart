import 'package:flutter/material.dart';

class MembersScreen extends StatefulWidget {
  MembersScreen({Key key, @required this.chamber}) : super(key: key);
  static const String id = 'members';
  final String chamber;
  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  String _getTitle() {
    if (widget.chamber == 'Joint') {
      return 'Joint Statements';
    }
    return 'Members for the ${widget.chamber}';
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
          'Members',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
