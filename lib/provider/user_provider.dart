import 'package:amazon/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{

  User _user = User(
    id: '', 
    email: '',
     name: '', 
     password: '',
      address: '',
       type: '',
        token: '');

        User get user => _user;

        //set the user when the user is authenticated
        void setUser(String user){
          _user = User.fromJson(user);
          notifyListeners();
        }
        
        void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}