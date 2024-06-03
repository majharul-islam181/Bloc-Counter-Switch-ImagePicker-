import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();
  @override
  List<Object> get props => [];
}

class PostFetch extends PostsEvent {}

class SearchItem extends PostsEvent {
  final String searchKeyWord;

  const SearchItem(this.searchKeyWord);
}
