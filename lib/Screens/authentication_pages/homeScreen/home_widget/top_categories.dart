import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});


  @override
  Widget build(BuildContext context) {
    return  Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
          height: 60,
          child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemExtent: 75,
            itemCount:GlobalVariables.categoryImages.length ,
            itemBuilder: (context,index){
              return Column(children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(GlobalVariables.categoryImages[index]['image']!,
                      fit: BoxFit.cover,height:40,width: 40,),
                    ),
                  ),
                  Text(GlobalVariables.categoryImages[index]['title']!,style:TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                  ))
              ],);
            })
          // Row(
          //   mainAxisAlignment:MainAxisAlignment.spaceAround,
          //   children: [
          //   Image.asset("assets/images/mobiles.jpeg",scale: 2,),
          //   Image.asset("assets/images/appliances.jpeg",scale: 2,),
          //   Image.asset("assets/images/books.jpeg",scale: 2,),
          //   Image.asset("assets/images/essentials.jpeg",scale: 3,),
          //   Image.asset("assets/images/fashion.jpeg",scale: 2,),
          // ],)
        );
  }
}