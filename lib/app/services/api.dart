import "package:flutter/foundation.dart";
import "package:covid_tracker/app/services/api_keys.dart"

class API {
    API({@required this.apiKey});
    final string apiKey;

    factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);

    Static final String host= 'apigw.nubentos.com';
    Static final int port = 443;

}
