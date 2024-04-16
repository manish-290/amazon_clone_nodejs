import 'package:amazon/Screens/authentication_pages/account_screen/account_screen.dart';
import 'package:amazon/Screens/authentication_pages/homeScreen/home.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 3;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text("Cart Screen"),),
  ];

  //update the page
  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          backgroundColor: GlobalVariables.backgroundColor,
          iconSize: 28,
          onTap: updatePage ,
          items: [
            //for home
            BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                      border: Border(
                          top: BorderSide(
                              color: _page == 0
                                  ? GlobalVariables.selectedNavBarColor
                                  : GlobalVariables.unselectedNavBarColor,
                              width: bottomBarBorderWidth))),
                  child: Icon(Icons.home_outlined),
            
                ),
                label: ''),

                //for profile
                BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                      border: Border(
                          top: BorderSide(
                              color: _page == 1
                                  ? GlobalVariables.selectedNavBarColor
                                  : GlobalVariables.unselectedNavBarColor,
                              width: bottomBarBorderWidth))),
                  child:  Icon(Icons.person_2_outlined),
                ),
                label: ''),

                //for cart page
                 BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                    //  borderRadius: BorderRadius.circular(50),
                      border: Border(
                          top: BorderSide(
                              color: _page == 2
                                  ? GlobalVariables.selectedNavBarColor
                                  : GlobalVariables.unselectedNavBarColor,
                              width: bottomBarBorderWidth))),
                  child:  Badge(
                        label: Text("10"),
                        backgroundColor: Colors.redAccent,

                        child: Icon(Icons.shopping_cart_outlined))
                ),
                label: ''),
          ]),
    );
  }
}
