import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:week6_tast_two/utils/model.dart';

Future<List<CoffeeType>> getCoffeeType() async {
  final url = Uri.parse('https://api.sampleapis.com/coffee/hot');
  try {
    final response = await http.get(url);
    final coffeeTypeList = <CoffeeType>[];
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      final rawJsonString = response.body;
      final jsonMap = jsonDecode(rawJsonString);
      for (var element in jsonMap) {
        final coffeeType = CoffeeType.fromJson(element);
        coffeeTypeList.add(coffeeType);
      }
      // if (kDebugMode) {
      //   print(coffeeTypeList.first);
      // }
    }
    return coffeeTypeList;
  } catch (e) {
    debugPrint(e.toString());
    return [];
  }
}
