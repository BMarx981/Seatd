import 'package:seatd/network_helper.dart';
import 'member.dart';

class MembersModel {
  dynamic data;
  List results;
  List<Member> memberList = List<Member>();

  Future getNetworkData(String url) async {
    NetworkHelper nh = NetworkHelper.url(url);
    data = await nh.getData();
    results = data['results'];
    for (var r in results) {
      List<dynamic> members = r['members'];
      if (r != null) {
        _getMemberData(members);
      }
    }
  }

  _getMemberData(dynamic members) {
    for (var l in members) {
      Member m = Member();
      if (l != null) {
        m.apiUri = l['api_uri'];
        m.phone = l['phone'];
        m.firstName = l['first_name'];
        m.lastName = l['last_name'];
        memberList.add(m);
      }
    }
  }
}
