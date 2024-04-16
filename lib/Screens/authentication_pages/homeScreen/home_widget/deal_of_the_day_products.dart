import 'package:flutter/material.dart';

class DealOfTheDayProducts extends StatefulWidget {
  const DealOfTheDayProducts({super.key});

  @override
  State<DealOfTheDayProducts> createState() => _DealOfTheDayProductsState();
}

class _DealOfTheDayProductsState extends State<DealOfTheDayProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left:10,top:10),
        child:const Text("Deal of the Day",style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ))
      ),
      Image.network(
        'https://static.skyassets.com/contentstack/assets/blt143e20b03d72047e/blt0dc3eb5cbdb256c8/6143763c77d06a0c9835dc38/PDP_Carousel_Apple_iPhone_13_Pink_1500x1500px_image3.png',
        height:200,
        fit: BoxFit.fitHeight,
      ),
      Container(
        padding: const EdgeInsets.only(left:20.0,top:10),
        alignment: Alignment.topLeft,
        child: const Text("\$999.0",style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        )),
      ),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal:20.0,vertical:10),
    child: Text(" Powered by the latest iteration of Apple's custom-designed A-series chipset, the iPhone 13 is poised to deliver unparalleled performance, with faster CPU and GPU speeds ensuring seamless multitasking and fluid operation. Camera capabilities are expected to receive significant upgrades, with advancements in sensor technology",
    style:TextStyle(
      color: Colors.black.withOpacity(0.7),
      fontSize: 12,
    )),
  ),
  Row(children: [
    Image.network(
      'https://static.skyassets.com/contentstack/assets/blt143e20b03d72047e/blt0dc3eb5cbdb256c8/6143763c77d06a0c9835dc38/PDP_Carousel_Apple_iPhone_13_Pink_1500x1500px_image3.png',
      fit: BoxFit.fitWidth,
      width: 100,
      height: 100,
    ),
     Image.network(
      'https://www.jacamo.co.uk/products/ar/ar550/v01ar550501s.jpg',
      fit: BoxFit.fitWidth,
      width: 100,
      height: 100,
    ),
     Image.network(
      'https://rukminim2.flixcart.com/image/850/1000/kyvvtzk0/cases-covers/flip-cover/x/n/q/silicone-fit-back-cover-case-for-iphone-13-mini-silicone-pink-original-imagbff6ypbu847h.jpeg?q=20',
      fit: BoxFit.fitWidth,
      width: 100,
      height: 100,
    ),
     Image.network(
      'https://kts.my/wp-content/uploads/2021/09/39b0e976eb3ff6a99aaea5ac9feff64a.jpeg',
      fit: BoxFit.fitWidth,
      width: 100,
      height: 100,
    ),
     Image.network(
      'https://cdn.lomax.dk/images/t_item_medium/f_auto/v1631791561/produkter/70124150_5/apple-iphone-13-mini-128gb-lyserod-5.jpg',
      fit: BoxFit.fitWidth,
      width: 100,
      height: 100,
    ),
  ],),
  Container(
    padding: EdgeInsets.only(top:10,left:15,bottom: 10),
    child:Row(
      children: [
        Text("See All Deals",style:TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color:Colors.teal
        )),
        Icon(Icons.arrow_right,color:Colors.teal)
      ],
    )
  )
    ],);
  }
}