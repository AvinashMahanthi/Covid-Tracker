import 'package:covid_tracker/app/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api.dart';
import 'api.dart';
import 'api.dart';

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

  Future<int> getEndpointData({
    @required String acessToken,
    @required Endpoint endpoint,
  }) async {
    final uri = api.endpointUri(endpoint);
    final responce = await http.get(
      uri.toString(),
      headers: {'Authorization': 'Bearer $acessToken'},
    );
    if (responce.statusCode == 200) {}
  }

  static Map<Endpoint, String> _responcejsonKeys = {
    Endpoint.cases: 'data',
    Endpoint.todayCases: 'data',
    Endpoint.active: 'data',
    Endpoint.deaths: 'data',
    Endpoint.todayDeaths: 'data',
    Endpoint.recovered: 'data',
    Endpoint.deathsPerOneMillion: 'data'
  };
}
