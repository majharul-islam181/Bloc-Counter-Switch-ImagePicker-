import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/posts_GET_api_Searching/posts_bloc.dart';
import 'package:flutter_bloc_practise/bloc/posts_GET_api_Searching/posts_event.dart';
import 'package:flutter_bloc_practise/bloc/posts_GET_api_Searching/posts_state.dart';
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
            case PostStatus.error:
              return Center(child: Text(state.message));
            case PostStatus.success:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Search with body',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (filterKey) {
                        context.read<PostsBloc>().add(SearchItem(filterKey));
                      },
                    ),
                  ),
                  Expanded(
                    child: state.searchMeassage.isNotEmpty
                        ? Text(state.searchMeassage.toString())
                        : ListView.builder(
                            itemCount: state.temPostList.isEmpty
                                ? state.postList.length
                                : state.temPostList.length,
                            itemBuilder: (context, index) {
                              if (state.temPostList.isEmpty) {
                                final item = state.postList[index];
                                return ListTile(
                                  title: Text(item.id.toString()),
                                  subtitle: Text(item.body.toString()),
                                );
                              } else {
                                final item = state.temPostList[index];
                                return ListTile(
                                  title: Text(item.id.toString()),
                                  subtitle: Text(item.body.toString()),
                                );
                              }
                            }),
                  )
                ],
              );
          }
        },
      ),
    );
  }
}
