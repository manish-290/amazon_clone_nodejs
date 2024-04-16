import 'package:amazon/Screens/authentication_pages/account_screen/widgets_account/single_product.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
List orders=[
  'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://media.istockphoto.com/id/1307086567/photo/generic-modern-suv-car-in-concrete-garage.jpg?s=612x612&w=is&k=20&c=AE9WrJ2g-a-1JuSrf5ZoBoz-Z9Bp2d14L0EDGnPCi1I=',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
    'https://media.istockphoto.com/id/1435491075/photo/business-logistics-technology-concept.jpg?s=612x612&w=is&k=20&c=poRXiKLcotOnnfxOFaq8MunIbNVkV49sNsyrF_KW92w='
];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text("Your Orders",style:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            )),
          ),
          Container(
            padding: EdgeInsets.only(right: 15),
            child: TextButton(
             
              onPressed: (){}, 
              child: Text("See All",style:TextStyle(
                
                  color: GlobalVariables.selectedNavBarColor,
                  fontWeight: FontWeight.bold)
              )),
          ),


        ],
      ),

      //display the orders
      Container(
        height:170,
        padding: EdgeInsets.only(left:20,top:20,right:0),
        child:ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: orders.length,
          itemBuilder: ((context, index) {
            return SingleProduct(image: orders[index]);
          }))
      )

    ],);
  }
}