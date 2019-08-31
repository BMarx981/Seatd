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

  List<Widget> getSubsList() {
    List<Widget> list = [];
    list.add(
      Container(
        child: Text(
          c.name,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
    list.add(
      Container(
        child: Text(
          'Lead by ${c.chair}, (${c.chairParty})',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
    list.add(
      Container(
        child: Text(
          'Chair\'s party: ${c.chairParty}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
    list.add(
      Container(
        child: Text(
          'id: ${c.id}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
    if (c.subs.length <= 0) {
      list.add(
        Container(
          child: Text('This committee does not have any subcommittees.'),
        ),
      );
    } else {
      list.add(
        Container(
          child: Text(
            'Subcommittees:',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      );
      for (var item in c.subs) {
        list.add(
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${item['name']} \n ${item['id']}',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
        );
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: getSubsList(),
      ),
    );
  }
}
