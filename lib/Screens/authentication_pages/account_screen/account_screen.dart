import 'package:amazon/Screens/authentication_pages/account_screen/widgets_account/orders.dart';
import 'package:amazon/common_elements/custombutton.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/provider/user_provider.dart';
import 'package:amazon/widgets/top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
          
          title:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                   
                    child:Image.asset("assets/images/amazon_in.png",scale:8)
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 3),
                    child: Row(children: [
                      IconButton(
                      onPressed: (){}, 
                      icon: Icon(Icons.notification_important)),
                      IconButton(
                      onPressed: (){}, 
                      icon: Icon(Icons.search)),
                    ],),
                  )
                ],
              ),
              Row(children: [
                Text("Hello, ",style: TextStyle(fontSize: 16),),
                Text(user.name,style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),
              ],),
            ],
          )
        )),
        body:Column(children: [
          TopButtons(),
          SizedBox(height: 20,),
          OrderPage()
        ],)
    );
  }
}