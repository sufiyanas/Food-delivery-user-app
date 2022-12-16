import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Chat/chatscreen.dart';
import 'package:food_deliever_app/presentation/Home/home.dart';
import 'package:food_deliever_app/presentation/Profile/profile_screen.dart';
import 'package:food_deliever_app/presentation/cart/cart_screen.dart';
import 'package:food_deliever_app/presentation/settings/settings_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

ValueNotifier<int> currentIndexNotifier = ValueNotifier(0);

class MianScreen extends StatelessWidget {
  const MianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List _pages = [
      HomeScreen(),
      ProfileScreen(),
      CartScreen(),
      SettingsScreen(),
    ];
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: currentIndexNotifier,
        builder: (context, int value, _) {
          return _pages[value];
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GNav(
              onTabChange: (newIndex) {
                currentIndexNotifier.value = newIndex;
              },
              // rippleColor: Colors.green,
              // hoverColor: Colors.green,
              activeColor: kthemeGreen,
              backgroundColor: Colors.grey.shade800,
              tabBackgroundColor: Colors.green.shade300.withOpacity(0.4),
              curve: Curves.easeInCirc, //for animation
              //tabMargin: EdgeInsets.all(5),//
              tabBorderRadius: 20,
              padding: const EdgeInsets.all(20),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              textStyle: TextStyle(color: Colors.white, fontSize: 15),
              // selectedIndex: ,
              // haptic: true,
              color: kthemeGrey,
              gap: 10,
              tabs: [
                GButton(
                    icon: Icons.home, iconColor: Colors.green, text: "Home"),
                GButton(
                    icon: Icons.person,
                    iconColor: kthemeGreen,
                    text: "Profile"),
                GButton(
                    icon: Icons.shopping_cart,
                    iconColor: kthemeGreen,
                    text: "Cart"),
                GButton(
                    icon: Icons.settings,
                    iconColor: kthemeGreen,
                    text: "Settings"),
              ]),
        ),
      ),
    );
  }
}
