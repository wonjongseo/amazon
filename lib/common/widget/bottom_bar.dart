import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/provider/user_provider.dart';
import 'package:amazon/screen/account/account_screen.dart';
import 'package:amazon/screen/cart/cart_screen.dart';
import 'package:amazon/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  void updatePage(int page) {
    _page = page;
    setState(() {});
  }

  List<Widget> pages = [HomeScreen(), AccountScreen(), CartScreen()];

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: GlobalVariables.secondaryColor,
        unselectedItemColor: GlobalVariables.secondaryColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          _bottomNavigationBarItem(
              currentPage: 0, icon: Icon(Icons.home_outlined)),
          _bottomNavigationBarItem(
              currentPage: 1, icon: Icon(Icons.person_outline)),
          _bottomNavigationBarItem(
              currentPage: 2,
              icon: Icon(Icons.shopping_cart_outlined),
              userCartLen: userCartLen.toString()),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      {required currentPage, required icon, userCartLen}) {
    return BottomNavigationBarItem(
        icon: Container(
          width: bottomBarWidth,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  color: _page == currentPage
                      ? GlobalVariables.selectedNavBarColor
                      : GlobalVariables.backgroundColor,
                  width: bottomBarBorderWidth),
            ),
          ),
          child: currentPage != 2
              ? icon
              : Badge(
                  elevation: 0,
                  badgeContent: Text(userCartLen.toString()),
                  badgeColor: Colors.white,
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
        ),
        label: '');
  }
}
