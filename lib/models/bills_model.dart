import 'package:seatd/network_helper.dart';
import 'bill.dart';

class BillsModel {
  List<dynamic> billsList = List<dynamic>();
  dynamic results;

  Future getNetworkData(String url) async {
    NetworkHelper nh = NetworkHelper.url(url);
    dynamic data = await nh.getData();
    results = data['results'];
    for (var result in results) {
      dynamic billList = result['bills'];
      _getBillInfo(billList);
    }
  }

  _getBillInfo(dynamic apiBills) {
    for (var apiBill in apiBills) {
      billsList.add(
        Bill(
          congress: apiBill['congress'].toString(),
          primarySubject: apiBill['primary_subject'].toString(),
          shortTitle: apiBill['short_title'].toString(),
          title: apiBill['title'].toString(),
          sponsor: apiBill['sponsor'].toString(),
          sponsorParty: apiBill['sponsor_party'].toString(),
          sponsorState: apiBill['sponsor_state'].toString(),
        ),
      );
      print(billsList);
    }
  }
}
