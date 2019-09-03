import 'package:flutter/material.dart';
import 'package:seatd/models/member.dart';

class MemberDetailScreen extends StatefulWidget {
  MemberDetailScreen({
    Key key,
    @required this.member,
  }) : super(key: key);
  final Member member;
  static const String id = 'memberDetail';
  @override
  _MemberDetailScreenState createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Member name goes here."),
    );
  }
}
