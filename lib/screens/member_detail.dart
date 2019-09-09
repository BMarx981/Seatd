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
  List<Container> committees = List<Container>();
  @override
  void initState() {
    super.initState();
    roles = widget.model.rolesList;
    member = widget.member;
    model = widget.model;
    _buildRoles(roles);
  }

  List<Widget> _buildRoles(List list) {
    for (var item in list) {
      committees.add(
        Container(
          child: Column(
            children: <Widget>[
              Text(item.name != null ? item.name : ''),
              Text(item.title != null ? item.title : ''),
              Text(item.side != null ? item.side : ''),
            ],
          ),
        ),
      );
    }
    return committees;
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
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:
                            _buildRoles(model.rolesList[index].roleCommittees),
                      ),
                    ),
//                    ListView.builder(
//                      itemBuilder: (context, index) {
//                        return committees[index];
//                      },
//                      itemCount: roles.length,
//                    ),
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
