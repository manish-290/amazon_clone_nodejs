import 'package:amazon/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 10),
          child: Column(children: [
            Row(
              children: [
                AccountButton(
                  onTap: (){}, text: "Your orders"),
                  SizedBox(width: 20,),
                  //for turn seller
                  AccountButton(onTap: (){}, text: "Turn Seller")
               
              ],
            ),
          SizedBox(height: 20,),
            Row(children: [
              //for logout
              AccountButton(onTap: (){}, text: "Log Out"),
               SizedBox(width: 20,),
                  //for wishlist
                  AccountButton(onTap: (){}, text: "Wish List")
            ],)
           
          ],),
        );
  }
}