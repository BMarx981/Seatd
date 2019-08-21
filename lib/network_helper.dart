import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'PoTWnFZutVt8ZgzbvY80cUn4SAw2XyQUb4N7ejJh';

class NetworkHelper {
  NetworkHelper({this.url = ''});
  NetworkHelper.url({this.url});
  final String url;

  Future getData() async {
    print(url);
    http.Response response = await http.get(
      url,
      headers: {
        'X-API-Key': apiKey,
      },
    );
    print(response.statusCode);
    return jsonDecode(response.body);
  }
}
