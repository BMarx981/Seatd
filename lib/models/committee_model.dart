import 'package:seatd/network_helper.dart';
import 'committee.dart';

class CommitteeModel {
  dynamic data;
  dynamic results;
  List<dynamic> committees;
  List<Committee> commitList = List<Committee>();

  void getNetworkData(String url) async {
    NetworkHelper nh = NetworkHelper.url(url);
    data = await nh.getData();
    results = data['results'];
    for (var r in results) {
      committees = r['committees'];
      _getInfo(committees);
    }
  }

  _getInfo(dynamic committees) {
    for (var c in committees) {
      Committee com = Committee();
      if (c != null) {
        com.id = c['id'];
        com.name = c['name'];
        com.apiUri = c['api_uri'];
        com.chair = c['chair'];
        com.chairParty = c['chair_party'];
        com.subs = c['subcommittees'];
        print(com.subs);
        commitList.add(com);
      }
    }
  }
}
