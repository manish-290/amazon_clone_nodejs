import 'dart:convert';

import 'package:amazon/Amazon_admin/admin_screen.dart';
import 'package:amazon/Screens/authentication_pages/homeScreen/home.dart';
import 'package:amazon/constants/error_handling.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/models/user_model.dart';
import 'package:amazon/provider/user_provider.dart';
import 'package:amazon/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  void signupUser({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      User user = User(
          id: '',
          email: email,
          name: name,
          password: password,
          address: '',
          type: '',
          token: '');

      //make post request
      http.Response response = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      //response handle
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Account created");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }

//function for login
  void loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      // final user = Provider.of<UserProvider>(context).user;
      http.Response response = await http.post(Uri.parse('$uri/api/login'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          });

      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
            //set the data to store
            await prefs.setString(
                'x-auth-token', jsonDecode(response.body)['token']);
            showSnackBar(context, "Signed-in Succcessfully.");
            Navigator.pushNamedAndRemoveUntil(
              //user.type =='user'? BottomBar.routeName:
                context, 
               AdminScreen.routeName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

//get the user data after token verification
  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      //make post request now
      var tokenRes = await http.post(Uri.parse('$uri/isValidToken'),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'x-auth-token': token!
          });

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        //get the user data only after authorization
        http.Response userRes = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json;charset=UTF-8',
              'x-auth-token': token
            });
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }
}
