import 'dart:convert';
import 'dart:io';
import 'package:flutter_api/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PostService {
  static const String postUrl = 'http://127.0.0.1:8000/api/posts';

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  static Future<DataPosts> listPosts() async {
    final token = await getToken();
    final response = await http.get(
      Uri.parse(postUrl),
      headers: {HttpHeaders.authorizationHeader: ' Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return DataPosts.fromJson(data);
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
