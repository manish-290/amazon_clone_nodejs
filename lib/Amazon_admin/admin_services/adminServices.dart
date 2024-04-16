import 'dart:io';

import 'package:amazon/constants/error_handling.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/models/products_model.dart';
import 'package:amazon/provider/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices{
  void sellProduct({
   required BuildContext context,
  required String name,
  required String description,
  required  double quantity,
  required double price,
  required String category,
  required List<File> images,
  }) async{
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    try{
      final cloudStorage= CloudinaryPublic('dpbpfdycc', 'pwdvnijz');
      List<String> imageUrl=[];
      //uploading the  product image to cloudinary server
      for(int i=0; i<images.length;i++){
        CloudinaryResponse res = await cloudStorage.uploadFile(
            CloudinaryFile.fromFile(images[i].path,folder: name)
        );
        imageUrl.add(res.secureUrl);
      }

      //create a product model
      Product product = Product(
        name: name, 
        price: price,
         category: category,
          quantity: quantity,
           images: imageUrl,
            description: description);

            //make a post request for products
          http.Response response= 
                await  http.post(Uri.parse('$uri/admin/addProduct'),
                headers: {
              'Content-Type':'application/json; charset=UTF-8',
              'x-auth-token': userProvider.user.token
            },
            body: product.toJson());

            httpErrorHandle(
              response: response,
               context: context,
                onSuccess: (){
                showSnackBar(context, "Product Added Successfully");
                Navigator.pop(context);
               });
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }
}