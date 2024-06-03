import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practise/model/favourite_item_model.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<FavouriteItemModel> favoriteItemList;
  final ListStatus listStatus;

  const FavouriteState({
    this.favoriteItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteState copyWith(
      {List<FavouriteItemModel>? favoriteItemList, ListStatus? listStatus}) {
    return FavouriteState(
        favoriteItemList: favoriteItemList ?? this.favoriteItemList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object?> get props => [favoriteItemList, listStatus];
}
