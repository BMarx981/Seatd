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
  }

  String _getTitle() {
    if (widget.chamber == 'Joint') {
      return 'Joint Members';
    }
    return 'Members of the ${widget.chamber}';
  }

  List<Widget> _getMembers() {
    List<Widget> list = [];
    list.add(
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text(
              'Members',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
          ),
        ),
      ),
    );
    for (var data in mm.memberList) {
      list.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20.0,
              ),
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: Text(data.title),
          ),
        ),
      );
    }
    return list;
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
        child: ListView(
          children: _getMembers(),
        ),
      ),
    );
  }
}
