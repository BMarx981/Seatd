import 'package:flutter/foundation.dart';
import 'package:seatd/network_helper.dart';

class CommitteeModel {
  dynamic data;
  dynamic results;
  List<dynamic> committees;

  Future getNetworkData(String url) async {
    NetworkHelper nh = NetworkHelper.url(url);
    data = await nh.getData();
    results = data['results'];
    for (var r in results) {
      committees = r['committees'];
    }
  }
}
