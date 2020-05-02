import 'dart:convert';

import 'package:http/http.dart' as http;
final String baseUrl = 'http://thirdparty.qonto.eu/v2/';

/// Function sends an authorized GET request with given id and secret for authentification to the given URL
/// 
/// @param endpoint The API endpoint that we want to call
/// @param id The user id that we used for authentification
/// @param secret The secret key used for authentification
/// @returns The Map object returned from API
Future<Map<String, dynamic>> authorizedRequest(
  String endpoint,
  String id,
  String secret
) async {
  var response = await http.get(
    '${baseUrl}${endpoint}',
    headers: <String, String>{'Authorization': '${id}:${secret}'}
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
  throw FormatException('${response.statusCode}: ${response.body}');
}


