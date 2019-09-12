import 'member.dart';

class Role extends Member {
  String congress, title, state, party, side, name;
  List roleCommittees = List();

  buildCommittees(List list) {
    print('buildC called');
    Role r = Role();
    for (var item in list) {
      print("build built");
      //name, title, side
      r.name = item['name'];
      r.title = item['title'];
      r.side = item['side'];
    }
    roleCommittees.add(r);
  }
}
