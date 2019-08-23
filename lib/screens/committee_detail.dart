import 'package:flutter/material.dart';
import 'package:seatd/models/committee_model.dart';

class CommitteeDetail extends StatefulWidget {
  CommitteeDetail({
    Key key,
    @required this.data,
  });
  final CommitteeModel data;
  static const String id = 'committeeDetail';
  @override
  _CommitteeDetailState createState() => _CommitteeDetailState();
}

class _CommitteeDetailState extends State<CommitteeDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Text('hello '),
      ),
    );
  }
}
