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

  List committees;
  List roles;

  @override
  toString() {
    String string =
        '$title $firstName $lastName born: $dateOfBirth party: $party State: $state Office Addr: $office';
    return string;
  }
}
