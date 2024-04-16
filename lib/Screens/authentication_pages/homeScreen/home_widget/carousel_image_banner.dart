import 'package:amazon/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImageSlider extends StatelessWidget {
  const CarouselImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((url){
        return Builder(
          builder: (BuildContext context)=>Image.network(
            url,
            fit: BoxFit.cover,
            height: 150,
          ));
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200
      ));
  }
}