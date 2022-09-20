import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/products.dart';

// Fetch our Products from API
Future<List<Product>> fetchProducts() async {
  const String apiUrl =
      "https://5f210aa9daa42f001666535e.mockapi.io/api/products";

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body);

    return parsed.map<Product>((json) => Product.fromJson(json)).toList();

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}