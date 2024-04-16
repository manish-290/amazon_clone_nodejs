import 'package:amazon/Screens/authentication_pages/homeScreen/home_widget/address_box.dart';
import 'package:amazon/Screens/authentication_pages/homeScreen/home_widget/carousel_image_banner.dart';
import 'package:amazon/Screens/authentication_pages/homeScreen/home_widget/deal_of_the_day_products.dart';
import 'package:amazon/Screens/authentication_pages/homeScreen/home_widget/top_categories.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65), 
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              
              gradient: GlobalVariables.appBarGradient
            ),
            
          ),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Expanded(
                child: Container(
                  height: 40,
                  margin:EdgeInsets.only(left:15),
                  child:Material(
                    borderRadius: BorderRadius.circular(8),
                    elevation: 4,
                    child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color:Colors.black38)
                      ),
                      border: InputBorder.none,
                      prefixIcon: InkWell(
                        onTap:(){},
                        child: Padding(
                          padding: const EdgeInsets.only(left:6.0),
                          child: Icon(Icons.search,size: 23,),
                        )),
                        contentPadding: EdgeInsets.only(top:10),
                      hintText: "Search Amazon.in",
                      hintStyle: TextStyle(color:Colors.grey[400],
                      fontSize: 17,
                      fontWeight: FontWeight.w500)
                    ),
                  ),
                  )
              
                  
                ),
              ),
              IconButton(icon: Icon(Icons.mic),
              onPressed: (){},)
            ],),
          
        )),
      body:SingleChildScrollView(
        child: Column(children: [
          
          AddressBox(),
          SizedBox(height: 10,),
          TopCategories(),
          SizedBox(height: 10,),
          CarouselImageSlider(),
          SizedBox(height: 10,),
          DealOfTheDayProducts()
       
           
        ],),
      )
      // Center(
      //   child: Text(user.toJson()),
      // )
    );
  }
}