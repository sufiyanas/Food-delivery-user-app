import 'package:bloc/bloc.dart';
import 'package:food_deliever_app/core/dbFunctions/search_functions.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchFood>((event, emit) async {
      List<FoodModal> searchedList =
          await SearchClass.foodSearch(searchVale: event.searchKey);
      emit(SearchState(searchedList: searchedList));
    });
  }
}
