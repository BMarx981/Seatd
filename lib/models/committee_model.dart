import 'package:seatd/network_helper.dart';
import 'committee.dart';

class CommitteeModel {
  dynamic data;
  dynamic results;
  Committee committee = Committee();
  List<dynamic> committees;
  List<Committee> commitList = List<Committee>();

  Future getNetworkData(String url) async {
    NetworkHelper nh = NetworkHelper.url(url);
    data = await nh.getData();
    results = data['results'];
    for (var r in results) {
      committees = r['committees'];
      _getInfo(committees, true);
    }
  }

  _getInfo(dynamic committees, bool isList) {
    for (var c in committees) {
      Committee com = Committee();
      if (c != null) {
        com.id = c['id'] != null ? c['id'] : '';
        com.name = c['name'] != null ? c['name'] : '';
        com.apiUri = c['api_uri'] != null ? c['api_uri'] : '';
        com.chair = c['chair'] != null ? c['chair'] : '';
        com.chairParty = c['chair_party'] != null ? c['chair_party'] : '';
        com.subs = c['subcommittees'] != null ? c['subcommittees'] : [];
        if (isList) {
          commitList.add(com);
        } else {
          committee = com;
        }
      }
    }
  }

  Future getSingleCommittee(String url) async {
    NetworkHelper nh = NetworkHelper.url(url);
    dynamic data = await nh.getData();
    dynamic results = data['results'];
    _getInfo(results, false);
  }
}
