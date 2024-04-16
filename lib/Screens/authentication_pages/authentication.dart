import 'package:amazon/Services/auth_services.dart';
import 'package:amazon/common_elements/customTextField.dart';
import 'package:amazon/common_elements/custombutton.dart';
import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';

enum Auth {
  signup,
  signin,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool passwordVisible = false;

  Auth authgroupValue = Auth.signup;
  final _signupKey = GlobalKey<FormState>();
  final _signinKey = GlobalKey<FormState>();

  //lets make a  signup controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

//create auth service
final AuthServices authService =  AuthServices();
  //signin controller
  final TextEditingController _emailSigninController = TextEditingController();
  final TextEditingController _passwordSigninController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();

    _emailSigninController.dispose();
    _passwordSigninController.dispose();
  }

  //function for auth signup
  void signupuser() {
    authService.signupUser(
      name: _nameController.text, 
      email: _emailController.text,
       password: _passwordController.text, 
       context: context);
  }
  //function for auth sign in
  void signInUser(){
    authService.loginUser(
      email: _emailSigninController.text,
       password: _passwordSigninController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
        appBar: AppBar(
          title: const Text("Welcome",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image.asset("assets/images/amazon_in.png", scale: 3),
                  ),
                  SizedBox(height: 15),
                  ListTile(
                    title: Text("Create an Account?",
                        style: TextStyle(color: GlobalVariables.secondaryColor)),
                    subtitle: Text("New To Amazon?",
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                    leading: Radio(
                        value: Auth.signup,
                        groupValue: authgroupValue,
                        onChanged: (Auth? val) {
                          setState(() {
                            authgroupValue = val!;
                          });
                        }),
                  ),
                  if (authgroupValue == Auth.signup)
                    Container(
                      padding: EdgeInsets.all(15),
                      color: GlobalVariables.backgroundColor,
                      child: Form(
                        key: _signupKey,
                        child: Column(
                          children: [
                            CustomTextField(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Full Name",
                                controller: _nameController, obsecure: false,),
                            SizedBox(height: 12),
                            CustomTextField(
                                prefixIcon: Icon(Icons.email),
                                obsecure: false,
                                hintText: "Email",
                                controller: _emailController),
                            SizedBox(height: 12),
                            CustomTextField(
                              obsecure: !passwordVisible,
                                prefixIcon: Icon(Icons.security),
                                hintText: " Create Password",
                                controller: _passwordController),
                            SizedBox(height: 12),
                            ListTile(
                              title: Text("Show password",
                                  style: TextStyle(color: Colors.grey[500])),
          
                              leading: Radio(
                                  toggleable: true,
                                  value: true,
                                  groupValue: passwordVisible,
                                  onChanged: (value) {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  }),
                            ),
                          
                            //signup node validation
                            CustomButton(text: "Sign Up", onTap: () {

                            if(_signupKey.currentState!.validate()){
                              signupuser();
                            }


                            }),
                            SizedBox(height: 12),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                      "By creating an account, you agree to Amazon  "),
                                  Text("Conditions of Use ",
                                      style: TextStyle(color: Colors.blue)),
                                  Text("and "),
                                  Text("Privacy Notice.",
                                      style: TextStyle(color: Colors.blue))
                                ],
                              ),
                            ),
          
                          ],
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    subtitle: Text("Already a Customer?",
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                    title: Text("Sign in?",
                        style: TextStyle(color: GlobalVariables.secondaryColor)),
                    leading: Radio(
                        value: Auth.signin,
                        groupValue: authgroupValue,
                        onChanged: (Auth? val) {
                          setState(() {
                            authgroupValue = val!;
                          });
                        }),
                  ),
                  if (authgroupValue == Auth.signin)
                    Container(
                      padding: EdgeInsets.all(15),
                      color: GlobalVariables.backgroundColor,
                      child: Form(
                        key: _signinKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              obsecure: false,
                                prefixIcon: Icon(Icons.alternate_email),
                                hintText: "Email",
                                controller: _emailSigninController),
                            SizedBox(height: 12),
                            CustomTextField(
                              obsecure: passwordVisible,
                                prefixIcon: Icon(Icons.password),
                                hintText: "Password",
                                controller: _passwordSigninController),
                            SizedBox(height: 12),
                            ListTile(
                              title: Text("Show password",
                                  style: TextStyle(color: Colors.grey[500])),
          
                              leading: Radio(
                                toggleable: true,
                                  value: false,
                                  groupValue: passwordVisible,
                                  onChanged: (value) {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  }),
                            ),
                            CustomButton(text: "Login", onTap: () {
                              if(_signinKey.currentState!.validate()){
                                signInUser();
                              }
                            }),
                            SizedBox(height: 12),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                      "By logging into an account, you agree to Amazon  "),
                                  Text("Conditions of Use ",
                                      style: TextStyle(color: Colors.blue)),
                                  Text("and "),
                                  Text("Privacy Notice.",
                                      style: TextStyle(color: Colors.blue))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
