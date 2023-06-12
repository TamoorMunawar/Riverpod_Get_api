import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/state/Home_state.dart';

final postProvider =
    StateNotifierProvider<PostNotifier, PostState>(((ref) => PostNotifier()));

class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('StateNotifierProvider Screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(postProvider.notifier).getPost();
        },
        child: const Icon(Icons.more),
      ),
      body: Center(
        child: Consumer(
          builder: ((context, ref, child) {
            PostState state = ref.watch(postProvider);
            if (state is PostInitialState) {
              return const Text('Press Button To Fetch Data');
            } else if (state is PostLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is PostLoadedState) {
              return _buildListView(state);
            } else if (state is PostErrorState) {
              return Text(state.message);
            } else {
              return const Text('Nothing');
            }
          }),
        ),
      ),
    );
  }

  Widget _buildListView(PostLoadedState state) {
    return ListView.builder(
        itemCount: state.posts.length,
        itemBuilder: ((context, index) {
          var post = state.posts[index];
          return ListTile(
            leading: CircleAvatar(child: Text(post.id.toString())),
            title: Text(post.title!),
          );
        }));
  }
}
