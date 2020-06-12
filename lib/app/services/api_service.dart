import 'package:covid_tracker/app/services/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  APIService(this.api);
  final API api;

  Future<String> getacesstoken() async {
    final response = await http.post(api.tokenUri().toString(),
        headers: {'Authorization': 'Basic ${api.apiKey}'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final acessToken = data['acess_token'];
      if (acessToken != Null) {
        return acessToken;
      }
    }
    print(
        'Request ${api.tokenUri()} failed\n Responce: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }
}
