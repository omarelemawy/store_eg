import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:store_eg/constants/widget.dart';
import 'package:store_eg/screens/category_screen.dart';

class ListCategoryScreen extends StatefulWidget {
   ListCategoryScreen(this.length,{Key? key}) : super(key: key);
  int? length;
  @override
  _ListCategoryScreenState createState() => _ListCategoryScreenState();
}

class _ListCategoryScreenState extends State<ListCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 3,
          mainAxisExtent: MediaQuery
              .of(context)
              .size
              .height / 6
      ),
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>CategoryScreen()));
          },
            child: Card());
      },
    );
  }

  Widget Card(){
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ),
          child: customCachedNetworkImage(
              url: "https://cdn.al-ain.com/images/2021/1/19/127-122833-trends-furniture-and-decor-2021_700x400.jpg",
              height: 100,
              width: 100,
              context: context,
              boxFit: BoxFit.fill
          ),
        ),
        SizedBox(height: 5,),
        Text("Living room",style: TextStyle(
          color: HexColor("#0D0D0D")
        ),)
      ],
    );
  }
}
