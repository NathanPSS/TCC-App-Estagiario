
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hujb/config/storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> openCheckIn(Map<String,dynamic> setor) async {
  final url = Uri.parse(
       '${dotenv.env['API_BASE_URL']!}/estagiario/check-in');

  final response = await http.post(
    url,
    body: json.encode({'id': setor['id'],'nome': setor['nome']}),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${(json.decode((await storage.read(key: "token"))!)['token'])!}'
    },
  );
  if (response.statusCode == 200) {
    debugPrint("Ok");
  } else {
    debugPrint('Failed to send data');
  }
}
Future<String> getCheckInCurrentTime() async {
  try {
    final url = Uri.parse(
        '${dotenv.env['API_BASE_URL']!}/estagiario/check-in-time');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer ${(json.decode((await storage.read(key: "token"))!)['token'])!}'
      },
    );
    if (response.statusCode == 200) {
      return response.body;

    } else {
      throw Exception("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error fetching check-in time: $e");
    return "";
  }
}
Future<bool> isCheckInOpen() async {
  try {
    final url = Uri.parse(
        '${dotenv.env['API_BASE_URL']!}/estagiario/is-checkIn-open');

    final response = await http.post(
      url,
      headers: {
        'Authorization':
        'Bearer ${(json.decode((await storage.read(key: "token"))!)['token'])!}'
      },
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}
Future<Map<String,dynamic>?> closeCheckIn() async {
  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/estagiario/check-out');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${(json.decode((await storage.read(key: "token"))!)['token'])!}'
    },
  );
  if (response.statusCode == 200) {
  return  json.decode(response.body);
  }
  return null;
}
Future<void> createRegistry(String description) async {
  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/estagiario/registry');
  final response = await http.post(
    url,
    body: json.encode({'description': description}),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${(json.decode((await storage.read(key: "token"))!)['token'])!}'
    },
  );
  if (response.statusCode == 200) {
    debugPrint("Ok");
  } else {
    debugPrint('Failed to send data');
  }
}

