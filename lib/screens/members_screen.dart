import 'package:flutter/material.dart';
import 'package:seatd/models/members_model.dart';
import 'package:seatd/screens/member_detail.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

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
  List memberList;
  ScrollController sc = ScrollController();
  @override
  initState() {
    super.initState();
    mm = widget.mm;
    memberList = _getMembers();
  }

  String _getTitle() {
    if (widget.chamber == 'Joint') {
      return 'Joint Members';
    }
    return 'Members of the ${widget.chamber}';
  }

  List<Widget> _getMembers() {
    List<Widget> list = [];
    for (var data in mm.memberList) {
      list.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () async {
              await mm.getSingleMember(data.apiUri);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      MemberDetailScreen(model: mm, member: data),
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
          ),
          Expanded(
            child: DraggableScrollbar.arrows(
              alwaysVisibleScrollThumb: true,
              backgroundColor: Colors.grey[500],
              controller: sc,
              labelTextBuilder: (offset) {
                int listIndex = sc.hasClients
                    ? (sc.offset /
                            sc.position.maxScrollExtent *
                            mm.memberList.length)
                        .floor()
                    : 0;

                if (listIndex > mm.memberList.length - 1) {
                  listIndex = mm.memberList.length - 1;
                }
                String name = mm.memberList[listIndex].lastName;
                String text = name.length > 7
                    ? name.substring(
                        0,
                        7,
                      )
                    : name;
                return Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                );
              },
              child: ListView.builder(
                controller: sc,
                itemCount: memberList.length,
                itemExtent: 195.0,
                itemBuilder: (context, index) {
                  return memberList[index];
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
