import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_state/model/postModel.dart';

class ApiService {
  getPost() async {
    List<PostModel> posts = [];
    try {
      http.Response response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        List<dynamic> postList = jsonDecode(response.body);
        posts = List.from(postList).map((e) => PostModel.fromJson(e)).toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return posts;
  }
}
