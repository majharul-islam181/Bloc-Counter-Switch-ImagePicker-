// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/posts_GET_api_Searching/posts_event.dart';
import 'package:flutter_bloc_practise/bloc/posts_GET_api_Searching/posts_state.dart';

import 'package:flutter_bloc_practise/utils/enum.dart';
import '../../model/posts_model.dart';
import '../../repository/posts_repository.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  List<PostModel> temPostList = [];
  PostRepository postRepository = PostRepository();

  PostsBloc() : super(PostsState()) {
    on<PostFetch>(_postFetch);
    on<SearchItem>(_searchItem);
  }

  void _searchItem(SearchItem event, Emitter<PostsState> emit) {
    if (event.searchKeyWord.isEmpty) {
      emit(state.copyWith(temPostList: [], searchMeassage: ''));
    } else {

      //for exact match for id
      // temPostList = state.postList
      //     .where((element) =>
      //         element.id.toString() == event.searchKeyWord.toString())
      //     .toList();

      // anything for body title
      // temPostList = state.postList
      //     .where((element) =>
      //         element.body!.toLowerCase().contains(event.searchKeyWord))
      //     .toList();

    // both id and body titile
    temPostList = state.postList
    .where((element) =>
        element.id.toString() == event.searchKeyWord.toString() ||
        element.body!.toLowerCase().contains(event.searchKeyWord.toLowerCase()))
    .toList();

      if (temPostList.isEmpty) {
        emit(state.copyWith(
            temPostList: temPostList, searchMeassage: 'No Data Found'));
      } else {
        emit(state.copyWith(temPostList: temPostList));
      }
    }
  }

  void _postFetch(PostFetch event, Emitter<PostsState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
        postsStatus: PostStatus.success,
        message: "success",
        postList: value,
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          postsStatus: PostStatus.error, message: error.toString()));
    });
  }
}
