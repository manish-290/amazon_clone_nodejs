// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFieldAdmin extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecure;
  
    int maxLines;
   CustomTextFieldAdmin({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obsecure,
     this.maxLines=1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ,
      obscureText: obsecure,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color:Colors.grey
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:Colors.grey
          ),
        ),
      ),
      validator: (val) {
        if(val == null || val.isEmpty){
          return "Enter your  ${hintText}";
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}

