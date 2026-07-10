import 'dart:convert';

import 'package:flutter/services.dart';

///Base data source with loadJson method
///Avoid repeatative methods and code

abstract class BaseDataSource {
  Future<Map<String, dynamic>> loadJson(String path) async {
    final jsonString = await rootBundle.loadString(path);
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }
}
