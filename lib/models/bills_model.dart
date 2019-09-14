import 'package:seatd/network_helper.dart';

class BillsModel {
  List<dynamic> bills = List<dynamic>();
  dynamic results;

  Future getNetworkData(String url) async {
    NetworkHelper nh = NetworkHelper.url(url);
    dynamic data = await nh.getData();
    results = data['results'];
    for (var result in results) {
      bills = result['bills'];
      _getBillInfo(bills);
    }
  }

  _getBillInfo(dynamic apiBills) {
    for (var bill in apiBills) {
      bills.add(bill);
    }
  }
}
