// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/posts/posts_event.dart';
import 'package:flutter_bloc_practise/bloc/posts/posts_state.dart';

import 'package:flutter_bloc_practise/utils/enum.dart';
import '../../repository/posts_repository.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostRepository postRepository = PostRepository();


  PostsBloc() : super(PostsState()) {
    on<PostFetch>(_postFetch);
  }


  void _postFetch(PostFetch event, Emitter<PostsState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
        postsStatus: PostStatus.success,
        message: "success",
        postList: value,
      ));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
          postsStatus: PostStatus.error, message: error.toString()));
    });
  }
}
