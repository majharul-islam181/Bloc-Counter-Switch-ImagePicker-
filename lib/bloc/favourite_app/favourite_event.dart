import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practise/model/favourite_item_model.dart';

abstract class FavouriteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteEvent {}

class FavouriteItem extends FavouriteEvent {
  // final FavouriteItemModel items;
  // const FavouriteEvent({required this.})
}
