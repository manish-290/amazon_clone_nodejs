// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  const AccountButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: MaterialButton(
                    elevation: 10,
                    hoverColor: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:30.0),
                      child: Text(text),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    color:Colors.grey[350],
                    onPressed: onTap),
    );
  }
}