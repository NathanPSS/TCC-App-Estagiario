

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../config/storage.dart';

Future<Map<String,dynamic>?> getAllRegistries() async {
  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/estagiario/allRegistries');
  print((await storage.read(key: "hujb_estagiario_jwt_token")));
  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${(json.decode((await storage.read(key: "hujb_estagiario_jwt_token"))!)['token'])!}'
    },
  );
  if (response.statusCode == 200) {
    try {
      return json.decode(response.body);
    } catch (e) {
      print('Error decoding JSON: $e');
      return null;
    }
  }
  return null;
}