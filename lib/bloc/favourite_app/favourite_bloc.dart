import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/favourite_app/favourite_event.dart';
import 'package:flutter_bloc_practise/bloc/favourite_app/favourite_state.dart';
import 'package:flutter_bloc_practise/model/favourite_item_model.dart';
import 'package:flutter_bloc_practise/repository/favourite_repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  List<FavouriteItemModel> favouriteItemList = [];

  FavouriteRepository favouriteRepository;
  FavouriteBloc(this.favouriteRepository) : super(const FavouriteState()) {
    on<FetchFavouriteList>(_fetchFavorite);
    on<FavouriteItem>(_favouriteItem);
  }

  void _fetchFavorite(
      FavouriteEvent event, Emitter<FavouriteState> emit) async {
    favouriteItemList = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favoriteItemList: List.from(favouriteItemList),
        listStatus: ListStatus.success));
  }

  void _favouriteItem(FavouriteEvent event, Emitter<FavouriteState> emit) {
    // emit();
  }
}
