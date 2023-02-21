import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/screen/admin/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdminScreen extends StatefulWidget {
  static const String routeName = '/admin';
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    OrderScreen(),
    Container(
      child: Text('2'),
    ),
    Container(
      child: Text('3'),
    )
  ];

  void updatePage(int page) {
    _page = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Text(
                'Admin',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          _bottomNavigationBarItem(0, const Icon(Icons.home_outlined)),
          _bottomNavigationBarItem(1, const Icon(Icons.analytics_outlined)),
          _bottomNavigationBarItem(2, const Icon(Icons.all_inbox_outlined)),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      int currentIndex, Icon icon) {
    return BottomNavigationBarItem(
      icon: Container(
          width: bottomBarWidth,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: _page == currentIndex
                    ? GlobalVariables.selectedNavBarColor
                    : GlobalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              ),
            ),
          ),
          child: icon),
      label: '',
    );
  }
}
