import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practise/model/posts_model.dart';

import '../../utils/enum.dart';

class PostsState extends Equatable {
  PostStatus postsStatus;
  List<PostModel> postList;
  String message;
  PostsState(
      {this.postsStatus = PostStatus.loading, this.postList = const [], 
      this.message = ''});

  PostsState copyWith({PostStatus? postsStatus, List<PostModel>? postList, String? message}) {
    return PostsState(postsStatus: postsStatus ?? this.postsStatus,
    postList: postList ?? this.postList, message: message ?? this.message);
  }

  @override
  List<Object> get props => [postsStatus, postList, message];
}
