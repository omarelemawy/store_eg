import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:store_eg/constants/color_constans.dart';
import 'package:store_eg/constants/widget.dart';
import 'package:store_eg/screens/home_bloc/home_cubit.dart';

import 'card_of_items.dart';
import 'home_bloc/home_state.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      HomeCubit()
        ..getHomeData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: backGroundColor,
            appBar: AppBar(
              backgroundColor: backGroundColor,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,
                  color: HexColor("#7C7D7E"),), onPressed: () {
                Navigator.pop(context);
              },
              ),
              centerTitle: false,
              actions: [
                IconButton(onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.search, color: HexColor("#7C7D7E"),),),
                IconButton(onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none, color: HexColor("#CA252B"),),),
                IconButton(onPressed: () {},
                  icon: Icon(CupertinoIcons.cart, color: HexColor("#7C7D7E"),),)
              ],
              title: Text("Fashion", style: TextStyle(
                  color: HexColor("#CA252B"),
                  fontSize: 16
              ),),
            ),
            body: state is GetLoadingHomeState?
            Center(
            child: SpinKitChasingDots(
            color: customColor,
            size: 20,
          ),
          ):NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverList(
                      delegate: SliverChildListDelegate(
                          <Widget>[
                            AllList(),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                SizedBox(width: 10,),
                                Icon(Icons.filter_list, color: HexColor("#7C7D7E"),),
                                SizedBox(width: 10,),
                                Icon(Icons.filter_list_alt, color: HexColor("#7C7D7E"),),

                                Spacer(),
                                Icon(Icons.list, color: HexColor("#7C7D7E"),),
                                SizedBox(width: 10,),
                              ],
                            ),
                            customCachedNetworkImage(
                                url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDTTOA76VAA9cliRgPMon8VdDUa0K9EDD3ng&usqp=CAU",
                                boxFit: BoxFit.fill,
                                context: context,
                                height: 80
                            ),
                          ])
                  ),
                ];
              },
              body:CardOfItem(HomeCubit.get(context).listOfHomeData),
            ),
            /*Column(
              children: [
                AllList(),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.filter_list, color: HexColor("#7C7D7E"),),
                    SizedBox(width: 10,),
                    Icon(Icons.filter_list_alt, color: HexColor("#7C7D7E"),),

                    Spacer(),
                    Icon(Icons.list, color: HexColor("#7C7D7E"),),
                    SizedBox(width: 10,),
                  ],
                ),
                customCachedNetworkImage(
                    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDTTOA76VAA9cliRgPMon8VdDUa0K9EDD3ng&usqp=CAU",
                    boxFit: BoxFit.fill,
                    context: context,
                    height: 80
                ),
                Expanded(child: CardOfItem(HomeCubit.get(context).listOfHomeData))

              ],
            ),*/



          );
        },
      ),
    );
  }
}


class AllList extends StatelessWidget {
  AllList({Key? key}) : super(key: key);
  List list = ["ALL", "Woman", "kids", "kids"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SizedBox(
            height: 40,
            child: ListView.separated(
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    HomeCubit.get(context).changeSelect(index);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: HomeCubit
                            .get(context)
                            .selected == index ? HexColor("#CA252B") : Colors
                            .white,
                        border: Border.all(color: HomeCubit
                            .get(context)
                            .selected == index ? Colors.white : HexColor(
                            "#CA252B"))
                    ),
                    child: Text(
                      list[index],
                      style: TextStyle(
                          color: HomeCubit
                              .get(context)
                              .selected == index ? Colors.white : HexColor(
                              "#CA252B")
                      ),
                    ),
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 10,);
            },

            ),
          );
        },
      ),

    );
  }
}


