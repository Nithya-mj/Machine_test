import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/hexcolor.dart';
import '../models/home_model.dart';
import '../providers/home_provider.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List<Values>? values;
  @override
  void initState() {
    Future.microtask(() => context.read<HomeProvider>().getData());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.maxFinite,
      child: Consumer<HomeProvider>(
        builder: (context, snapshot,child) {
          if(snapshot.homeModel?.homeData ==null){
            return SizedBox();
          }
          return Padding(
            padding: const EdgeInsets.only(left: 10,),
            child: ListView.builder(itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(right: 20,),
                child: Column(
                  children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration:  BoxDecoration(
                                color: HexColor('#FAE7E7'),
                              borderRadius:BorderRadius.all(Radius.circular(40.0))
                            ),
                          ),
                           Image.network(
                             snapshot.category?[index].imageUrl??'https://media.istockphoto.com/vectors/image-preview-icon-picture-placeholder-for-website-or-uiux-design-vector-id1222357475?k=20&m=1222357475&s=612x612&w=0&h=jPhUdbj_7nWHUp0dsKRf4DMGaHiC16kg_FSjRRGoZEI=',
                             //snapshot.homeModel!.homeData![index].type='category',
                             //   'https://media.istockphoto.com/vectors/image-preview-icon-picture-placeholder-for-website-or-uiux-design-vector-id1222357475?k=20&m=1222357475&s=612x612&w=0&h=jPhUdbj_7nWHUp0dsKRf4DMGaHiC16kg_FSjRRGoZEI=',
                             height: 40,
                             width: 40,
                           ),
                        ],
                      ),
                    Expanded(child: Text(snapshot.category?[index].name ?? ''))
                  ],
                ),
              );
            },
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.category!.length,
            ),
          );
        }
      ),
    );
  }
}
