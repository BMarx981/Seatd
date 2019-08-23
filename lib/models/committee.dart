class Committee {
  String id, name, apiUri, chair, chairParty;
  List subs = [];

  @override
  String toString() {
    String str =
        'Id: $id, Name: $name, ApiUri: $apiUri, Chair: $chair, ChairParty: $chairParty';
    return str;
  }
}
