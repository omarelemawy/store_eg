import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:store_eg/constants/color_constans.dart';
import 'package:store_eg/constants/widget.dart';

import 'list_of_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: Column(
           children: [
             SizedBox(
               height: 50,
             ),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Expanded(child: customCachedNetworkImage(
                     url: "https://lh3.googleusercontent.com/p/AF1QipOc31rayTmuSQx5xdSKDFoIZMEY4xkyarkFIgAp=w1080-h608-p-no-v0",
                     boxFit: BoxFit.fill,context: context,
                     width:width/5,
                     height: 40
                 ),),
                 SizedBox(width: 20,),
                 Expanded(
                   flex: 6,
                   child: Container(
                     height: 40,
                     child: TextFormField(
                       decoration: InputDecoration(
                         prefixIcon: Icon(
                           Icons.search
                         ),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30),
                           borderSide: BorderSide(color: HexColor("#7C7D7E"))
                         )
                       ),
                     ),
                   ),
                 ),
                 SizedBox(width: 10,),
                 Icon(Icons.notifications_none,color: HexColor("#CA252B"),),
                 SizedBox(width: 10,),
                 Icon(CupertinoIcons.cart,color: HexColor("#7C7D7E"),),
                 SizedBox(width: 10,),
               ],
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 10,),
                              Text("Fashion",style: TextStyle(
                                color: HexColor("#CA252B"),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),),
                              SizedBox(height: 5,),
                              Text("(180 items )",style: TextStyle(
                                color: HexColor("#CECBCB")
                              ),),
                              SizedBox(height: 10,),
                            ],
                          ),
                          Spacer(),
                          Text("SEE ALL",style: TextStyle(
                              color: HexColor("#CA252B"),
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),),
                        ],
                      ),
                      ListCategoryScreen(3),
                    ],
                  ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 10,),
                              Text("Fashion",style: TextStyle(
                                  color: HexColor("#CA252B"),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),),
                              SizedBox(height: 5,),
                              Text("(180 items )",style: TextStyle(
                                  color: HexColor("#CECBCB")
                              ),),
                              SizedBox(height: 10,),
                            ],
                          ),
                          Spacer(),
                          Text("SEE ALL",style: TextStyle(
                              color: HexColor("#CA252B"),
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),),
                        ],
                      ),
                      ListCategoryScreen(6),
                    ],
                  ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 10,),
                              Text("Fashion",style: TextStyle(
                                  color: HexColor("#CA252B"),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),),
                              SizedBox(height: 5,),
                              Text("(180 items )",style: TextStyle(
                                  color: HexColor("#CECBCB")
                              ),),
                              SizedBox(height: 10,),
                            ],
                          ),
                          Spacer(),
                          Text("SEE ALL",style: TextStyle(
                              color: HexColor("#CA252B"),
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),),
                        ],
                      ),
                      ListCategoryScreen(6),
                    ],
                  ),
               ),
             ),

           ],
        ),
      ),
    );
  }
}
