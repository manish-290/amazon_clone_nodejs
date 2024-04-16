import 'package:amazon/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatefulWidget {
  const AddressBox({super.key});

  @override
  State<AddressBox> createState() => _AddressBoxState();
}

class _AddressBoxState extends State<AddressBox> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
          height:30,
          width: double.infinity,
          color:const Color.fromARGB(255, 3, 210, 189).withOpacity(0.7),
          child:Row(children: [
            Icon(Icons.location_on_outlined,color:Colors.black),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:5.0),
              child: Text("Delivery to ${user.name} -  Hetauda Ward-3 Street",
              style:TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500
              ),
              overflow: TextOverflow.ellipsis,),
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(left:8.0,top: 2),
             child: Icon(Icons.arrow_drop_down,size: 17,),
           )
          ],)
        );
      
  }
}