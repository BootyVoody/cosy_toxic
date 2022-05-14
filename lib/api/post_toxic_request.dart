import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;

Future<http.Response> postToxicResponse() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  String? identifier;

  if (Platform.isAndroid) {
    final build = await deviceInfoPlugin.androidInfo;
    identifier = build.androidId;
  } else if (Platform.isIOS) {
    final data = await deviceInfoPlugin.iosInfo;
    identifier = data.identifierForVendor;
  }

  final uri = Uri.parse('http://172.105.91.137:8080/increase');
  final response = await http.post(
    uri,
    headers: {'Content-type': 'application/json'},
    body: jsonEncode({'deviceId': identifier}),
  );

  return response;
}
