import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/service/Home_service.dart';

import '../model/postModel.dart';

@immutable
abstract class PostState {}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<PostModel> posts;
  PostLoadedState({required this.posts});
}

class PostErrorState extends PostState {
  final String message;
  PostErrorState({required this.message});
}

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier() : super(PostInitialState());
  final ApiService _httpService = ApiService();

  getPost() async {
    try {
      state = PostLoadingState();
      List<PostModel> posts = await _httpService.getPost();
      state = PostLoadedState(posts: posts);
    } catch (e) {
      state = PostErrorState(message: e.toString());
    }
  }
}
