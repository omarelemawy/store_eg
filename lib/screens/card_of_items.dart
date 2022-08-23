import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:store_eg/screens/home_bloc/home_cubit.dart';
import '../constants/color_constans.dart';
import '../constants/widget.dart';
import '../model/collection_model.dart';
import 'home_bloc/home_state.dart';

/*class CardOfItem extends StatefulWidget {
  CardOfItem(this.items, {Key? key}) : super(key: key);
  List<Item>? items;

  @override
  State<CardOfItem> createState() => _CardOfItemState();
}

class _CardOfItemState extends State<CardOfItem> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child:  GridView.builder(
                itemCount: widget.items!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    mainAxisExtent: MediaQuery
                        .of(context)
                        .size
                        .height / 2.5
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {},
                      child: cardItem(widget.items, index));
                },
              ),
          );
        },
      ),
    );
  }

  Widget cardItem(List<Item>? items, index) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: customCachedNetworkImage(
                    url: items![index].image,
                    height: 160,
                    width: 180,
                    context: context,
                    boxFit: BoxFit.fill
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_border, color: HexColor("#FFFFFF"),),
                  ))
            ],
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(items[index].productName!, style: TextStyle(
                    color: HexColor("#131111"),
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
                Text(items[index].brandName!, style: TextStyle(
                    color: HexColor("#131111"),
                    fontSize: 11,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 35,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(items[index].price!, style: TextStyle(
                            color: HexColor("#131111"),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                        Text(items[index].netPrice!, style: TextStyle(
                            color: HexColor("#7C7D7E"),
                            fontSize: 16,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: HexColor("#CA252B")
                      ),
                      child: Icon(
                        CupertinoIcons.cart, color: HexColor("#FFFFFF"),),
                    )
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}*/
class CardOfItem extends StatelessWidget {
  CardOfItem(this.items, {Key? key}) : super(key: key);
  List<Item>? items;
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<HomeCubit>(context).getHomeData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<HomeCubit>(context).getHomeData();
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is DataLoading && state.isFirstFetch) {
          return _loadingIndicator();
        }
        bool isLoading = false;
        List<Item> items = [];
        if (state is DataLoading) {
          items = state.oldData;
          isLoading = true;
        } else if (state is DataLoaded) {
          items = state.items;
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            controller: scrollController,
            itemCount: items.length + (isLoading ? 1 : 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisExtent: MediaQuery
                    .of(context)
                    .size
                    .height / 2.5
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              if (index < items.length)
                return cardItem(items, index, context);
              else {
                Timer(Duration(milliseconds: 30), () {
                  scrollController
                      .jumpTo(scrollController.position.maxScrollExtent);
                });

                return _loadingIndicator();
              }
             /* return InkWell(
                  onTap: () {},
                  child: cardItem(items, index, context));*/
            },
          ),
        );
      },
    );

  }
  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: SpinKitChasingDots(
        color: customColor,
        size: 20,
      )),
    );
  }
  Widget cardItem(List<Item>? items, index, context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: customCachedNetworkImage(
                    url: items![index].image,
                    height: 160,
                    width: 180,
                    context: context,
                    boxFit: BoxFit.fill
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_border, color: HexColor("#FFFFFF"),),
                  ))
            ],
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(items[index].productName!, style: TextStyle(
                    color: HexColor("#131111"),
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
                Text(items[index].brandName!, style: TextStyle(
                    color: HexColor("#131111"),
                    fontSize: 11,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 35,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(items[index].price!, style: TextStyle(
                            color: HexColor("#131111"),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                        Text(items[index].netPrice!, style: TextStyle(
                            color: HexColor("#7C7D7E"),
                            fontSize: 16,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: HexColor("#CA252B")
                      ),
                      child: Icon(
                        CupertinoIcons.cart, color: HexColor("#FFFFFF"),),
                    )
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}

