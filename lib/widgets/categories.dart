import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/const.dart';
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
      margin: const EdgeInsets.only(top: 20.0),
      height: MediaQuery.of(context).size.height * 0.15,
      width: double.maxFinite,
      child: Consumer<HomeProvider>(
        builder: (context, snapshot,child) {
          if(snapshot.homeModel?.homeData ==null){
            return const SizedBox();
          }
          return Padding(
            padding: const EdgeInsets.only(left: 10,),
            child: ListView.builder(itemBuilder: (context,index){
              return Container(
                margin: const EdgeInsets.only(right: 20,),
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
                              borderRadius:const BorderRadius.all(Radius.circular(40.0))
                            ),
                          ),
                           /*Image.network(
                              snapshot.category?[index].imageUrl??'https://image.pngaaa.com/721/1915721-middle.png',
                             //   'https://media.istockphoto.com/vectors/image-preview-icon-picture-placeholder-for-website-or-uiux-design-vector-id1222357475?k=20&m=1222357475&s=612x612&w=0&h=jPhUdbj_7nWHUp0dsKRf4DMGaHiC16kg_FSjRRGoZEI=',
                             height: 40,
                             width: 40,
                           ),*/
                          FadeInImage.assetNetwork(placeholder: Const.placeholder, image: snapshot.category?[index].imageUrl??'',
                            height: 40,width: 40,)
                        ],
                      ),
                    Expanded(child: Text(snapshot.category?[index].name ?? '',style: const TextStyle(fontSize: 13,color: Colors.black),))
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
