import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ProHelper {
  String api =
      "https://fakestoreapi.com/products?_gl=1*14oqrdn*_ga*MTYxOTU3NDY0NS4xNzEyNDAwMTc1*_ga_ZCYG64C7PL*MTcyMzAxNTUzMC4xMi4xLjE3MjMwMTU4NTQuMC4wLjA.";

  Future<List> proApiHelper() async {
    Uri url = Uri.parse(api);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      List data = jsonDecode(json);
      return data;
    } else {
      return [];
    }
  }
}
