import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/posts/posts_bloc.dart';
import 'package:flutter_bloc_practise/bloc/posts/posts_event.dart';
import 'package:flutter_bloc_practise/bloc/posts/posts_state.dart';
import 'package:flutter_bloc_practise/utils/enum.dart';

class PostsScreens extends StatefulWidget {
  const PostsScreens({super.key});

  @override
  State<PostsScreens> createState() => _PostsScreensState();
}

class _PostsScreensState extends State<PostsScreens> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostsBloc>().add(PostFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts Screen(Get Api)"),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          switch (state.postsStatus) {
            case PostStatus.loading:
              return const Center(
                  child: CircularProgressIndicator(
                strokeWidth: 0.5,
              ));
            case PostStatus.success:
              return ListView.builder(
                  itemCount: state.postList.length,
                  itemBuilder: (context, index) {
                    final item = state.postList[index];
                    return ListTile(
                      title: Text(item.email.toString()),
                      subtitle: Text(item.body.toString()),
                    );
                  });
            case PostStatus.error:
              return Center(child: Text(state.message));
          }
        },
      ),
    );
  }
}
