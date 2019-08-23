import 'package:seatd/network_helper.dart';
import 'committee.dart';

class CommitteeModel {
  dynamic data;
  dynamic results;
  List<Committee> committees;

  void getNetworkData(String url) async {
    NetworkHelper nh = NetworkHelper.url(url);
    data = await nh.getData();
    results = data['results'];
    for (var r in results) {
      committees = r['committees'];
    }
    for (var c in committees) {
      Committee com = Committee();
      com.chair = c['chair'];
      com.apiUri = c['api_uri'];
      com.id = c['id'];
      com.chairParty = c['chair_party'];
      if (c['subcommittee'] != null) {
        for (var s in c['subcommittees']) {
          com.subs.add(s);
        }
      }
      committees.add(com);
    }
  }
}
