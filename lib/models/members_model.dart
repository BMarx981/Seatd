import 'package:seatd/network_helper.dart';
import 'member.dart';
import 'role.dart';

class MembersModel {
  dynamic data;
  List results;
  List<Member> memberList = List<Member>();
  List<Role> rolesList = List<Role>();

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
        //********************* Detailed Member fields **************

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
    rolesList.clear();
    NetworkHelper nh = NetworkHelper.url(url);
    dynamic data = await nh.getData();
    List results = data['results'];
    for (var r in results) {
      List roles = r['roles'];

      for (var item in roles) {
        Role role = Role();
        role.title = item['title'] != null ? item['title'] : '';
        role.firstName = item['first_name'] != null ? item['first_name'] : '';
        role.lastName = item['last_name'] != null ? item['last_name'] : '';
        role.dateOfBirth =
            item['date_of_birth'] != null ? item['date_of_birth'] : '';
        role.congress = item['congress'] != null ? item['congress'] : '';
        role.state = item['state'] != null ? item['state'] : '';
        role.phone = item['phone'] != null ? item['phone'] : '';
        role.party = item['party'] != null ? item['party'] : '';
        role.roleCommittees = item['committees'];
        rolesList.add(role);
      }
    }
  }
}
