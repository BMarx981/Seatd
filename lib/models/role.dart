import 'member.dart';

class Role extends Member {
  String congress, title, state, party, side, name;
  List roleCommittees = List();

  buildCommittees(List list) {
    for (var item in list) {
      //name, title, side
      name = item['name'];
      title = item['title'];
      side = item['side'];
    }
  }
}
