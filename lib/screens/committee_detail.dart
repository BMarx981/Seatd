import 'package:flutter/material.dart';
import 'package:seatd/models/committee.dart';

class CommitteeDetail extends StatefulWidget {
  CommitteeDetail({
    Key key,
    @required this.data,
  });
  final Committee data;
  static const String id = 'committeeDetail';
  @override
  _CommitteeDetailState createState() => _CommitteeDetailState();
}

class _CommitteeDetailState extends State<CommitteeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Committee Details'),
      ),
      body: SafeArea(
        child: CommitteeContainer(widget.data),
      ),
    );
  }
}

class CommitteeContainer extends StatelessWidget {
  CommitteeContainer(this.c);
  final Committee c;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Colors.black,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              c.name,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 6.0),
            Text(
              'Lead by ${c.chair}, (${c.chairParty})',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              'id: ${c.id}',
              style: TextStyle(fontSize: 30),
            ),
//            Container(
//                child: ListView(
//              children: <Widget>[],
//            ))
          ],
        ),
      ),
    );
  }
}
