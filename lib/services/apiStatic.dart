import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/petani.dart';

Future<Petani> fetchPetani() async {
  final response =
      await http.get(Uri.parse('https://dev.wefgis.com/api/petani?s'));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response,
    // then parse the JSON.
    var json = jsonDecode(response.body);
    final data = json['data'];

    // Check if data is a list and is not empty
    if (data is List && data.isNotEmpty) {
      // Take the first element of the list
      final firstData = data[0];

      // Convert the first element to Petani object
      return Petani.fromJson(firstData as Map<String, dynamic>);
    } else {
      throw Exception('Data is empty or not in the expected format');
    }
  } else {
    // If the server does not return a 200 OK response,
    // throw an exception.
    throw Exception('Failed to load data');
  }
}
