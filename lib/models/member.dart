class Member {
  String id,
      firstName,
      lastName,
      title,
      apiUri,
      dateOfBirth,
      state,
      party,
      office,
      phone;

  List memberCommittees = List();
  List roles = List();

  @override
  toString() {
    String string =
        '$title $firstName $lastName born: $dateOfBirth party: $party State: $state Office Addr: $office';
    return string;
  }
}
