import 'package:flutter/cupertino.dart';

class Bill {
  Bill(
      {@required this.congress,
      this.primarySubject,
      this.shortTitle,
      this.sponsor,
      this.title,
      this.sponsorParty,
      this.sponsorState});
  String congress,
      primarySubject,
      shortTitle,
      sponsor,
      sponsorParty,
      sponsorState,
      title;
  List<String> committees = List<String>();
  List<BillActions> actions = List<BillActions>();

  @override
  String toString() {
    return '$title, $shortTitle, $sponsor, $sponsorState, $congress';
  }
}

class BillActions {
  String id, chamber, actionType, datetime, description;
}
