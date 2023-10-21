import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hujb/config/storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<void> setToken(String username,String password) async {
  final url = Uri.parse(
    '${dotenv.env['API_BASE_URL']!}/estagiario/auth');
  final response = await http.post(
    url,
    body: json.encode({'username': username,'password': password}),
    headers: {
      'Content-Type': 'application/json',
    },
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    await storage.write(key: "token", value: response.body);
  } else {
    debugPrint('Failed to send data');
  }
}

Future<bool> hasValidToken() async {
  var token = json.decode((await storage.read(key: "token"))!)['expireAt'];
  if(token != null){
    if(isValidToken(token)){
      return true;
    }
    return false;
  }
  return false;
}

bool isValidToken(String expireAt) {
  return DateTime.now().isBefore(DateTime.parse(expireAt));
}