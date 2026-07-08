import 'dart:convert';

import 'package:flutter/services.dart';

abstract class BaseDataSource {
  Future<Map<String, dynamic>> loadJson(String path) async {
    final jsonString = await rootBundle.loadString(path);
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }
}
