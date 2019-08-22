import 'package:flutter/material.dart';
import 'package:seatd/models/members_model.dart';

class MembersScreen extends StatefulWidget {
  MembersScreen(
      {Key key,
      @required this.chamber,
      @required this.congressNum,
      @required this.mm})
      : super(key: key);
  final String chamber;
  final String congressNum;
  final MembersModel mm;
  static const String id = 'members';
  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  MembersModel mm;
  @override
  initState() {
    super.initState();
    mm = widget.mm;
    _getTitle();
    print(mm.data['results']);
  }

  String _getTitle() {
    if (widget.chamber == 'Joint') {
      return 'Joint Members';
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
