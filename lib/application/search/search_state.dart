part of 'search_bloc.dart';

@immutable
class SearchState {
  final List<FoodModal> searchedList;

  SearchState({required this.searchedList});
}

class SearchInitial extends SearchState {
  SearchInitial() : super(searchedList: []);
}
