import 'package:flutter/material.dart';
import 'package:seatd/models/members_model.dart';
import 'package:seatd/models/member.dart';

class MemberDetailScreen extends StatefulWidget {
  MemberDetailScreen({
    Key key,
    @required this.member,
    @required this.model,
  }) : super(key: key);
  final MembersModel model;
  final Member member;
  static const String id = 'memberDetail';
  @override
  _MemberDetailScreenState createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
  List<Member> roles;
  Member member;
  MembersModel model;
  @override
  void initState() {
    super.initState();
    roles = widget.model.rolesList;
    member = widget.member;
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${member.lastName}, ${member.firstName}'),
      ),
      body: Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Congress ${model.rolesList[index].congress}'),
                        Text(
                            '${model.rolesList[index].title} for the State of ${model.rolesList[index].state}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Party: ${model.rolesList[index].party}'),
                      ],
                    ),
                    Container(
                      height: 75.0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.rolesList[index].roleCommittees.length,
                        separatorBuilder: (context, index) {
                          return Divider(indent: 16.0, color: Colors.blue);
                        },
                        itemBuilder: (context, i) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(model.rolesList[index].roleCommittees[i]
                                            .name !=
                                        null
                                    ? model
                                        .rolesList[index].roleCommittees[i].name
                                    : '1'),
                                Text(model.rolesList[index].roleCommittees[i]
                                            .title !=
                                        null
                                    ? model.rolesList[index].roleCommittees[i]
                                        .title
                                    : '2'),
                                Text(model.rolesList[index].roleCommittees[i]
                                            .side !=
                                        null
                                    ? model
                                        .rolesList[index].roleCommittees[i].side
                                    : '3'),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: roles.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
        ),
      ),
    );
  }
}
