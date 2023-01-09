import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_deliever_app/application/search/search_bloc.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Notification/notification_screen.dart';
import 'package:food_deliever_app/presentation/SearchScreen/widgets/custem_tile.dart';
import 'package:food_deliever_app/presentation/SearchScreen/widgets/itemcart.dart';
import 'package:food_deliever_app/presentation/widget/bigtext.dart';
import 'package:food_deliever_app/presentation/widget/custom_app_bar.dart';
import 'package:food_deliever_app/presentation/widget/textformfield_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            khight20,
            CustomAppBar(
              textone: "Find Your",
              texttwo: "Favorate Food",
              actionButton: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(20)),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => (NotificationScreen()),
                    ));
                  },
                  icon: Badge(
                    badgeColor: Colors.red,
                    child: Icon(
                      Icons.notifications_none,
                      size: 30,
                      color: kthemeGreen,
                    ),
                  ),
                ),
              ),
            ),
            Textfieldwidget(
              controller: searchController,
              onchnaged: (p0) {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchFood(searchKey: p0));
              },
              labeltext: "What do you want to order?",
              prefixicon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            BigTextWithBold(
              text: "Type",
            ),
            Row(
              children: [
                ItemCartSearchScreen(
                  text: "Restaurent",
                  ontapfunction: () {},
                ),
                ItemCartSearchScreen(
                  text: "Menu",
                  ontapfunction: () {},
                ),
              ],
            ),
            khight10,
            BigTextWithBold(
              text: "Food Type",
            ),
            Row(
              children: [
                ItemCartSearchScreen(
                  text: "veg",
                  ontapfunction: () {},
                ),
                ItemCartSearchScreen(
                  text: "non-veg",
                  ontapfunction: () {},
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: state.searchedList.length,
                    itemBuilder: (context, index) {
                      return CustomTile(
                        mwidth: 100,
                        foodmodel: state.searchedList[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
