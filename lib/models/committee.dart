class Committee {
  String id, name, apiUri, chair, chairParty;
  List subs = [];

  getInfo(List committees) {
    for (var c in committees) {
      if (c != null) {
        id = c['id'];
        name = c['name'];
        apiUri = c['api_uri'];
        chair = c['chair'];
//        for (var s in c['subcommittees']) {
//          if (s != null) {
//            subcommittees.add(s);
//          }
//        }
      }
    }
  }
}
