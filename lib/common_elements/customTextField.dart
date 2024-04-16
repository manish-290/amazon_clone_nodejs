import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecure;
  final dynamic prefixIcon;
  const CustomTextField({super.key,
    required this.controller,
    required this.obsecure,
    required this.hintText,
    required this.prefixIcon
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller ,
        obscureText: obsecure,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon ,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color:Colors.black38
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:Colors.black
            ),
          ),
        ),
        validator: (val) {
          if(val == null || val.isEmpty){
            return "Enter your  ${hintText}";
          }
          return null;
        },
      ),
    );
  }
}

