import 'package:flutter/material.dart';
import 'package:seatd/models/members_model.dart';
import 'package:seatd/models/member.dart';
import 'package:seatd/screens/member_detail.dart';
import 'package:seatd/network_helper.dart';

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
          child: GestureDetector(
            onTap: () {
              mm.getSingleMember(data.apiUri);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MemberDetailScreen(member: data),
                ),
              );
            },
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Title: ${data.title}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Name: ${data.firstName} ${data.lastName}, DOB: ${data.dateOfBirth}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Party: ${data.party} State: ${data.state}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Phone #: ${data.phone}',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Office Address: ${data.office}',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
      backgroundColor: Colors.grey[300],
      body: Container(
        child: ListView(
          children: _getMembers(),
        ),
      ),
    );
  }
}
