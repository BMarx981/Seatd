import 'package:flutter/material.dart';
import 'package:seatd/models/members_model.dart';
import 'package:seatd/models/member.dart';

class MemberDetailScreen extends StatefulWidget {
  MemberDetailScreen({
    Key key,
    @required this.member,
  }) : super(key: key);
  final MembersModel member;
  static const String id = 'memberDetail';
  @override
  _MemberDetailScreenState createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
  List<Member> roles;
  @override
  void initState() {
    super.initState();
    roles = widget.member.rolesList;
    print(roles);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Detail'),
      ),
      body: Container(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                '${roles[index].title.toString()} ${roles[index].firstName} ${roles[index].lastName}'),
          );
        },
        itemCount: roles.length,
      )),
    );
  }
}
