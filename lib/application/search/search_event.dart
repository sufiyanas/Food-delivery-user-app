part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchFood extends SearchEvent {
  final String searchKey;

  SearchFood({required this.searchKey});
}
