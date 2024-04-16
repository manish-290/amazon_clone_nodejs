import 'dart:io';

import 'package:amazon/Amazon_admin/admin_services/adminServices.dart';
import 'package:amazon/common_elements/customTextField.dart';
import 'package:amazon/common_elements/customTextFieldAdmin.dart';
import 'package:amazon/common_elements/custombutton.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/constants/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'dart:html' as html;
// import 'dart:typed_data';
// import 'package:image_picker/image_picker.dart';

class AddProductsScreen extends StatefulWidget {
    static const String routeName = '/addProducts';
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {

  final _addProductFormKey = GlobalKey<FormState>();
  TextEditingController NameController = TextEditingController();
 TextEditingController DescriptionController = TextEditingController();
  TextEditingController PriceController = TextEditingController();
   TextEditingController QuantityController = TextEditingController();
final AdminServices adminServices = AdminServices();
   
   @override
   void dispose(){
    super.dispose();
    DescriptionController.dispose();
    NameController.dispose();
    PriceController.dispose();
    QuantityController.dispose();
   }

   String category = 'iOS and Android Phones';
   List<File> images=[];

//list of categories for drop down item
List<String> productCategories=[
  "iOS and Android Phones",
  "Essentials",
  "Appliances",
  "Fashion",
  "Books",

];

//implementation using file picker
void _selectImage() async{
  var res =await pickImages();
  setState(() {
    images = res;
  });
}


//web file picker
// List<Uint8List> _selectedFilesBytes=[];
// List<Widget> children = [];
// Future<void> startWebFilePicker() async {
//     html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
//     uploadInput.multiple = true;
//     uploadInput.draggable = true;
//     uploadInput.click();

//     uploadInput.onChange.listen((e) {
//       final files = uploadInput.files;

//      // _selectedFilesBytes = [];
//       for (var i = 0; i < files!.length; i++) {
//         final file = files[i];
//         final reader = new html.FileReader();
//         reader.onLoadEnd.listen((event) {
//           _selectedFilesBytes.add(reader.result as Uint8List);
//         });
//         reader.onError.listen((event) {
//           print('there was an error');
//         });
//         reader.readAsArrayBuffer(file);
//       }
//       setState(() {
//         for (var imageBytes in _selectedFilesBytes) {
//             children.add(Image.memory(imageBytes));
//           }
//       });
//     });
//   }


//function for adding the product
void addProduct() {
   if(_addProductFormKey.currentState!.validate() && images.isEmpty){
    adminServices.sellProduct(
    context: context,
     name: NameController.text, 
     description: DescriptionController.text, 
     quantity: double.parse(QuantityController.text), 
     price: double.parse(PriceController.text),
      category: category,
       images: images);
   }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65), 
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient
            ),
          ),
          
          title:Row(
            
            children: [
              Container(
                alignment: Alignment.topLeft,
               padding: EdgeInsets.only(right:50),
                child:Image.asset("assets/images/amazon_in.png",scale:8)
              ),
             
              Text("Add Products",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
            ],
          )
        )), 
        body: SingleChildScrollView(
          child: Form(
            key: _addProductFormKey ,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                
                children: [
                  images.isNotEmpty? 
                  CarouselSlider(
      items: images.map((url){
        return Builder(
          builder: (BuildContext context)=>Image.file(
            url,
            fit: BoxFit.cover,
            height: 150,
          ));
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200
      ))
                 
                 :GestureDetector(
                    onTap: _selectImage,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(15),
                      strokeWidth: 1.5,
                      dashPattern: [6,6],
                      child: Container(
                        width:double.infinity,
                        height:140,
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Icon(Icons.folder_open_outlined),
                          SizedBox(height: 15,),
                          Text("Select Product Image",style:TextStyle(
                            color:Colors.grey[400]
                          ))
                        ],)
                      )),
                  ),
                    SizedBox(height: 25,),
                    //name of product
                    CustomTextFieldAdmin(
                      controller: NameController,
                       obsecure: false,
                        hintText: "Product Name",
                         ),
                        SizedBox(height: 12,),
                         //for description
                         CustomTextFieldAdmin(
                      controller: DescriptionController,
                      maxLines: 5,
                       obsecure: false,
                        hintText: "Description",
                        ),

                         SizedBox(height: 12,),
                         //for price
                         CustomTextFieldAdmin(
                      controller:PriceController,
                       obsecure: false,
                        hintText: "Price",
                        ),
                         SizedBox(height: 12,),

                         //quantity
                         CustomTextFieldAdmin(
                      controller: QuantityController,
                       obsecure: false,
                        hintText: "Quantity",
                         ),

                         SizedBox(height: 12,),
                         SizedBox(
                          width: double.infinity,
                          child:DropdownButton(
                            value: category,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: productCategories.map((String item){
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item)
                              );
                            }).toList(), 
                            onChanged: (String? newVal){
                                    setState(() {
                                      category = newVal!;
                                    });
                            })
                         ),
                         SizedBox(height: 40,),
                         CustomButton(
                          text: "Sell", onTap: addProduct),
                ],
                        ),
            )),
        ),
    );
  }
}

//  List<File> pickedImage=[];
//   // List<File> pickedImage=[];
//  List<Uint8List> webImage= [];
//   // List<Uint8List> webImage= [];
//   Future<List<File>> takePicture() async {
//     if(!kIsWeb){
//         List<XFile> images = await ImagePicker()
//         .pickMultiImage(maxWidth: 200,maxHeight: 100 ,imageQuality: 40);
//     if (images.isNotEmpty) {
//       // var selected = File(images);
//       setState(() {
//        pickedImage= images as List<File>;
//       });
//     }else{
//       print("No images has been picked");
//     }
//     //    XFile? image = await ImagePicker()
//     //     .pickImage(source: ImageSource.gallery, imageQuality: 40);
//     // if (image != null) {
//     //   var selected = File(image.path);
//     //   setState(() {
//     //    pickedImage= selected;
//     //   });
//     // }else{
//     //   print("No images has been picked");
//     // }
//     // return pickedImage!;
//     }
//     //for web
//     else if (kIsWeb){
//         List<XFile>? images = await ImagePicker()
//         .pickMultiImage(maxWidth: 200,maxHeight: 100 ,imageQuality: 40);
//     if (images.isNotEmpty) {
//       setState(() {
//         pickedImage = images as List<File>;
//       });
//       // for(var img in images){
//       //   pickedImage.add(File(img.path) as Uint8List);
//       // }
//     }else{
//       print("No images has been picked");
//     }
  
//     //     XFile? image = await ImagePicker()
//     //     .pickImage(source: ImageSource.gallery, imageQuality: 40);
//     // if (image != null) {
//     //   var imageBytes = await image.readAsBytes();
//     //   setState(() {
//     //    webImage= imageBytes;
//     //   //  pickedImage = File("a");
//     //   });
//     // }else{
//     //   print("No images has been picked");
//     // }
//     // return webImage as File;
//     }else{
//       print("something went wrong");
      
//     }
//     return  pickedImage!;
   
//   }