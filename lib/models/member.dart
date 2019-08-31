class Member {
  String id,
      firstName,
      lastName,
      title,
      apiUri,
      dateOfBirth,
      state,
      party,
      phone;

  @override
  toString() {
    String string =
        '$title $firstName $lastName born: $dateOfBirth party: $party State: $state';
    return string;
  }
}
