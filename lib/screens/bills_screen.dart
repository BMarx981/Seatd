import 'package:flutter/material.dart';
import 'package:seatd/models/bills_model.dart';

//https://api.propublica.org/congress/v1/bills/search.json?query={query}
class BillsScreen extends StatefulWidget {
  BillsScreen({
    Key key,
    @required this.chamber,
    @required this.congressNum,
    @required this.bm,
  }) : super(key: key);
  final String chamber;
  final String congressNum;
  final BillsModel bm;
  static const String id = 'bills';
  @override
  _BillsScreenState createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  BillsModel bm;
  @override
  initState() {
    super.initState();
    bm = widget.bm;
    _getTitle();
  }

  String _getTitle() {
    if (widget.chamber == 'Joint') {
      return 'Joint Bills';
    }
    return 'Bills for the ${widget.chamber}';
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
        child: Text(
          'Bills',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
