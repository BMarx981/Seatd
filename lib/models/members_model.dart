import 'package:seatd/network_helper.dart';

class MembersModel {
  dynamic data;
  List results;

  Future getNetworkData(String url) async {
    NetworkHelper nh = NetworkHelper.url(url);
    data = await nh.getData();
  }
}
