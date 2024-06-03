import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practise/model/posts_model.dart';

import '../../utils/enum.dart';

class PostsState extends Equatable {
  PostStatus postsStatus;
  List<PostModel> postList;
  List<PostModel> temPostList;
  String message;
  String searchMeassage;
  PostsState(
      {this.postsStatus = PostStatus.loading,
      this.postList = const <PostModel>[],
      this.message = '',
      this.temPostList = const <PostModel>[],
      this.searchMeassage = '',});

  PostsState copyWith(
      {PostStatus? postsStatus,
      List<PostModel>? postList,
      String? message,
      List<PostModel>? temPostList, String? searchMeassage}) {
    return PostsState(
        postsStatus: postsStatus ?? this.postsStatus,
        postList: postList ?? this.postList,
        message: message ?? this.message,
        temPostList: temPostList ?? this.temPostList,
        searchMeassage: searchMeassage ?? this.searchMeassage);
  }

  @override
  List<Object> get props => [postsStatus, postList, message, temPostList, searchMeassage];
}
