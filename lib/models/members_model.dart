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
    for (var item in members) {
      Member m = Member();
      if (item != null) {
        m.apiUri = item['api_uri'] != null ? item['api_uri'] : '';
        m.phone = item['phone'] != null ? item['phone'] : '';
        m.firstName = item['first_name'] != null ? item['first_name'] : '';
        m.lastName = item['last_name'] != null ? item['last_name'] : '';
        m.title = item['title'] != null ? item['title'] : '';
        m.party = item['party'] != null ? item['party'] : '';
        m.state = item['state'] != null ? item['state'] : '';
        m.dateOfBirth = _processDOB(DateTime.parse(item['date_of_birth']));
        m.office = item['office'] != null ? item['office'] : '';
        memberList.add(m);
      }
    }
  }

  String _processDOB(DateTime dobInput) {
    if (dobInput == null) {
      return '';
    }
    String month = dobInput.month.toString();
    String day = dobInput.day.toString();
    String year = dobInput.year.toString();
    return '$month/$day/$year';
  }

  Future getSingleMember(String url) async {
    NetworkHelper nh = NetworkHelper.url(url);
    Member m = Member();
    dynamic data = await nh.getData();
    List results = data['results'];
    for (var r in results) {
      List roles = r['roles'];
      print(roles);
    }

//    for (var role in m.roles) {
//      m.committees = role['committees'];
//    }
  }
}
