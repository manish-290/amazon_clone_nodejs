import 'package:amazon/Amazon_admin/admin_bar_screens/products_screen.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  static const routeName = '/admin-home';
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page =0;
   double bottomBarWidth = 42;
  double bottomBarBorderWidth = 3;

  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages=[
    ProductScreen(),
    Center(child: Text("Analytics"),),
    Center(child: Text("Order page"),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65), 
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient
            ),
          ),
          
          title:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
               
                child:Image.asset("assets/images/amazon_in.png",scale:8)
              ),
             
              Text("Admin",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
            ],
          )
        )), 
        body: pages[_page],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          backgroundColor: GlobalVariables.backgroundColor,
          iconSize: 28,
          onTap: updatePage ,
          items: [
            //for admin post page
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

                //for analytics
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
                  child:  Icon(Icons.analytics_outlined),
                ),
                label: ''),

                //for orders page
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
                  child:  Icon(Icons.all_inbox_outlined)
                ),
                label: ''),
          ]),
      );
  }
}