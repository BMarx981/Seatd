class Bill {
  String congress,
      primarySubject,
      shortTitle,
      sponsor,
      sponsorParty,
      sponsorState,
      title;
  List<String> committees = List<String>();
  List<BillActions> actions = List<BillActions>();
}

class BillActions {
  String id, chamber, actionType, datetime, description;
}
