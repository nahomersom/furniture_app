import 'dart:convert';
import 'package:furniture_app/models/categories.dart';
import 'package:http/http.dart' as http;
Future <List<Category>> fetchCategories() async{
  const String apiUrl =
      "https://5f210aa9daa42f001666535e.mockapi.io/api/categories";
  final response = await http.get(Uri.parse(apiUrl));
  if(response.statusCode == 200){
    final parsed = jsonDecode(response.body);

    return parsed.map<Category>((json) => Category.fromJson(json)).toList();

  }else{
    print('exceptions');
   throw Exception('failed to Load');

  }
}

