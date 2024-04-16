
import 'package:amazon/Amazon_admin/admin_screen.dart';
import 'package:amazon/Screens/authentication_pages/homeScreen/home.dart';
import 'package:amazon/Services/auth_services.dart';
import 'package:amazon/provider/user_provider.dart';
import 'package:amazon/routes.dart';
import 'package:amazon/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/authentication_pages/authentication.dart';
import 'constants/global_variables.dart';

void main(){
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>UserProvider())
    ],
    child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
final AuthServices authService = AuthServices();

@override
void initState(){
  super.initState();
  authService.getUserData(context: context);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Amazon Clone ",
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor
        ),
        appBarTheme: const AppBarTheme(
          elevation: 13,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        )
      ),
      onGenerateRoute: (settings)=> generateRoutes(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          :const AuthScreen(),
    );
  }
}
