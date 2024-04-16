import 'package:amazon/Amazon_admin/admin_bar_screens/add_products.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {

  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
void navigateToAddProduct(){
  Navigator.pushNamed(context, AddProductsScreen.routeName);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Products"),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: GlobalVariables.selectedNavBarColor,
        elevation: 10,
        enableFeedback: true,
        tooltip: "Add a product",
        child: Icon(Icons.add),
        onPressed: navigateToAddProduct,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}